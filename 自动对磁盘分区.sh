#!/bin/bash
fdisk /dev/vdb << EOF
n
p
1


wq
EOF
mkfs.xfs /dev/vdb1
if [ -e /data ];then
exit
fi
mkdir /data
echo "/dev/vdb1 /data xfs defaults 0 0" >> /etc/fstab
mount -a
