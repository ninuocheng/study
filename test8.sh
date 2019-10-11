#!/bin/bash
#编写创建用户并配置密码的脚本
#初版
useradd abc
echo 123 | passwd --stdin abc
