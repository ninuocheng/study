#!/bin/bash
#能够为本机快速配好Yum仓库
cd /etc/yum.repos.d
rm -rf *
echo "[centos7.0]
name=centos
baseurl=ftp://172.25.0.250/centos-1804
enabled=1
gpgcheck=0" >  centos.repo
echo "[classroom]
name=class
baseurl=http://172.25.0.254/content/rhel7.0/x86_64/dvd/
enabled=1
gpgcheck=0" >> centos.repo
