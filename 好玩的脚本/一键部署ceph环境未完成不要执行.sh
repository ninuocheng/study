#!/bin/bash

#注意：此脚本只适用于丁老师课程ceph集群提前准备好的环境!!!

#检测expect是否安装,如果未安装，则装一遍
rpm -ql expect
if [ ! $? -eq 0 ];then
	yum -y install expect
else
#准备真机Yum源
expect <<EOF
spawn ssh -o StrictHostKeyChecking=no root@192.168.4.254
expect "password:" { send "123457\r" }
expect "#" { send "umount /var/ftp/ceph\r" } 
expect "#" { send "rm -rf /var/ftp/ceph\r" } 
expect "#" { send "mkdir /var/ftp/ceph\r" } 
expect "#" { send "mount /linux-soft/02/ceph10.iso /var/ftp/ceph\r" }
expect "#" { send "exit\r" }
expect "#" { send "exit\r" }
EOF
fi

#配置所有主机SSH远程免密
ls /root/.ssh/id_rsa &> /dev/null
if [ $? -eq 0 ];then
        rm -rf /root/.ssh/id_rsa
        ssh-keygen -f /root/.ssh/id_rsa -N ''
for i in {10..13}
do
expect << EOF
spawn ssh-copy-id 192.168.4.$i
expect "password:" { send "123456\r" }
expect "password:" { send "123456\r" } 
done
EOF
done
else
        ssh-keygen -f /root/.ssh/id_rsa -N ''
for i in {10..13}
do
expect << EOF
spawn ssh-copy-id 192.168.4.$i
expect "password:" { send "123456\r" }
expect "password:" { send "123456\r" } 
done
EOF
done
fi

#配置主机/etc/hosts文件
echo "192.168.4.10 client" >> /etc/hosts
echo "192.168.4.11 node1" >> /etc/hosts
echo "192.168.4.12 node2" >> /etc/hosts
echo "192.168.4.13 node3" >> /etc/hosts

#拷贝/ect/hosts文件至其他所有主机，保证域名解析一致
for i in {10..13}
do
	scp /etc/hosts 192.168.4.$i:/etc/
done

#配置主机yum源
echo'[mon]
name=mon
baseurl=ftp://192.168.4.254/ceph/MON
gpgcheck=0
[osd]
name=osd
baseurl=ftp://192.168.4.254/ceph/OSD
gpgcheck=0
[tools]
name=tools
baseurl=ftp://192.168.4.254/ceph/Tools
gpgcheck=0' > /ect/yum.repos.d/ceph.repo

#将yum仓库文件拷贝至所有主机，保证yum源统一
for i in {10..13}
do
	scp /etc/yum.repos.d/ceph.repo 192.168.4.$i:/etc/yum.repos.d/
done

#配置NTP服务器同步时间
sed -i '7c server 192.168.4.254 iburs ' /etc/chrony.conf

#拷贝ntp配置文件至所有主机，保证时间一致
for i in {10..13}
do
	scp /etc/chrony.conf 192.168.4.$i:/etc/
	ssh 192.168.4.$i "systemctl restart chronyd"
done

#安装部署ceph-deploy,创建ceph-deploy工作目录
yum -y install ceph-deploy
mkdir ceph-cluster
cd ceph-cluster

#创建Ceph集群配置,在ceph-cluster目录下生成Ceph配置文件,定义monitor主机是谁
ceph-deploy new node1 node2 node3

#给所有节点安装ceph相关软件包
for i in 11 12 13
do
    ssh  192.168.4.$i "yum -y install ceph-mon ceph-osd ceph-mds ceph-radosgw"
done 

#初始化所有节点的mon服务，也就是启动mon服务
ceph-deploy mon create-initial


#在每个节点将vdb进行分区（vdb1和vdb2这两个分区用来做存储服务器的缓存盘
for i in 11 12 13
do
     ssh 192.168.4.$i "parted /dev/vdb mklabel gpt"
     ssh 192.168.4 $i "parted /dev/vdb mkpart primary 1 50%"
     ssh 192.168.4.$i "parted /dev/vdb mkpart primary 50% 100%"
done

#为每个节点上修改分区后磁盘的权限，让ceph软件对其有读写的操作权限
for i in 11 12 13
do
	ssh 192.168.4.$i "chown ceph:ceph /dev/vdb1"
	ssh 192.168.4.$i "chown ceph:ceph /dev/vdb2"
	ssh 192.168.4.$i "echo ENV{DEVNAME}=="/dev/vdb1",OWNER="ceph",GROUP="ceph" > /etc/udev/rules.d/70-vdb.rules"
	ssh 192.168.4.$i "echo ENV{DEVNAME}=="/dev/vdb2",OWNER="ceph",GROUP="ceph" >> /etc/udev/rules.d/70-vdb.rules"
done

#初始化清空磁盘数据
ceph-deploy disk  zap  node1:vdc   node1:vdd
ceph-deploy disk  zap  node2:vdc   node2:vdd
ceph-deploy disk  zap  node3:vdc   node3:vdd

#创建OSD存储空间
