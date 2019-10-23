#!/bin/bash
#使用expect工具自动交互密码远程其它主机安装httpd软件
#删除~/.ssh/known_hosts
rm -rf ~/.ssh/known_hosts
expect << EOF
spawn ssh 192.168.4.10
expect "yes/no" {send "yes\r"}
#根据自己的实际情况将密码修改为真实的密码子串
expect "password" {send "123456\r"}
expect "#" {send "yum -y install httpd\r"}
expect "#" {send "exit\r"}
EOF
