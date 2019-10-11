#!/bin/bash
url="http://172.25.254.254/content/rhel7.0/x86_64/dvd/"
cd /etc/yum.repos.d/ && rm -rf *
echo "[gzc]
name=abc
baseurl=$url
enabled=1
gpgcheck=0" >  abc.repo
