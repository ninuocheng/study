#!/bin/bash
#编写一键部署ftp服务的脚本
yum -y install vsftpd > /dev/null
systemctl start vsftpd
systemctl enable vsftpd
