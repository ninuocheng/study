#!/bin/bash
#编写一个点名器脚本
#该脚本,需要提前准备一个user.txt文件
#该文件中需要包含所有姓名的信息,一行一个姓名,脚本每次随机显示一个姓名
while :
do
#统计user.txt文件中有多少用户
line=`cat user.txt | wc -l`
num=$[RANDOM%line+1]
sed -n  "${num}p"  user.txt
sleep 0.2
clear
done
