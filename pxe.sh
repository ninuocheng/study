#!/bin/bash
yum clean all  &>  /dev/null
#a=$(yum repolist  2> /dev/null  |  sed  -n '/^repolist:/s/,//p' | awk  '/^repolist/{print $2}')
a=$(yum repolist  2> /dev/null  |  sed  -n '/^repolist:/p' | awk  '{print $2}')
if [ "$a" ==   0  ];then
echo  "yum源不可用"  &&  exit
else
b=${a#*,}
[ "$b" !=  0 ] && yum  -y install dhcp  tftp-server  syslinux  system-config-kickstart  wget
fi
dhcp=/etc/dhcp/dhcpd.conf
sed  -i  '$asubnet 192.168.4.0 netmask 255.255.255.0 {\
range 192.168.4.100 192.168.4.200;\
option domain-name-servers 192.168.4.10;\
option routers 192.168.4.254;\
default-lease-time 600;\
max-lease-time 7200;\
next-server 192.168.4.10;\
filename "pxelinux.0";\
}' $dhcp
cd /var/lib/tftpboot
cp /usr/share/syslinux/pxelinux.0  .
mkdir pxelinux.cfg
wget  192.168.4.254/dvd/isolinux/{vmlinuz,initrd.img,vesamenu.c32,splash.png}
wget -O  pxelinux.cfg/default  192.168.4.254/dvd/isolinux/isolinux.cfg
default=/var/lib/tftpboot/pxelinux.cfg/default
sed  -i '1c[development]'  /etc/yum.repos.d/*.repo
sed  -i '62amenu default'  $default
sed  -i  '65cappend initrd=initrd.img ks=http://192.168.4.254/ks.cfg' $default
sed  -i  '66,123d'  $default
systemctl start dhcpd  tftp
