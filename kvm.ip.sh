#!/bin/bash
# 不登陆虚拟机,修改虚拟机网卡 IP 地址 
# 该脚本使用 guestmount 工具,Centos7.2 中安装 libguestfs‐tools‐c 可以获得 guestmount 工具
# 脚本在不登陆虚拟机的情况下,修改虚拟机的 IP 地址信息
# 在某些环境下,虚拟机没有 IP 或 IP 地址与真实主机不在一个网段
# 真实主机在没有 virt‐manger 图形的情况下,远程连接虚拟机很麻烦
# 该脚本可以解决类似的问题
read -p "请输入虚拟机名称:" name
if virsh domstate $name | grep -q running ;then
	echo "修改虚拟机网卡数据,需要关闭虚拟机"
	virsh destroy $name
fi
mountpoint="/media/virtimage"
[ ! -d $mountpoint ] && mkdir $mountpoint
echo "请稍后..."
if mount | grep -q "$mountpoint" ;then
	umount $mountpoint
fi
guestmount  -d $name -i $mountpoint
read -p "请输入需要修改的网卡名称:" dev
read -p "请输入 IP 地址:" addr
# 判断原本网卡配置文件中是否有 IP 地址,有就修改该 IP,没有就添加一个新的 IP 地址
if grep -q "IPADDR"  $mountpoint/etc/sysconfig/network‐scripts/ifcfg‐$dev ;then
	sed -i "/IPADDR/s/=.*/=$addr/"  $mountpoint/etc/sysconfig/network‐scripts/ifcfg‐$dev
else
	echo "IPADDR=$addr" >> $mountpoint/etc/sysconfig/network‐scripts/ifcfg‐$dev
fi
# 如果网卡配置文件中有客户配置的 IP 地址,则脚本提示修改 IP 完成
awk -F= -v x=$addr '$2==x{print "完成..."}'  $mountpoint/etc/sysconfig/network‐scripts/ifcfg-$dev
