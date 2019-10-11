#!/bin/bash
read -p "请输入用户名" u
[ -z $u ] && echo "你倒是给个名字啊!" && exit
useradd $u
stty -echo
read -p "请输入密码" p
stty echo
[ -z $p ] && echo "你倒是给个密码啊!" && exit
echo $p | passwd --stdin $u
