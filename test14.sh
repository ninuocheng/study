#!/bin/bash
#能够为本机快速装配好vsftpd服务
[ $UID != 0 ] && echo "你不是超级管理员" && exit
yum -y install vsftpd &> /dev/null
systemctl start vsftpd
systemctl enable vsftpd
