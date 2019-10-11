#!/bin/bash
a=$[RANDOM%100]
while :
do
read  -p "请输入一个随机数" n
let i++
if [ $n -eq $a ];then
echo "$i猜对了"
exit
elif [ $n -gt $a ];then
echo "猜大了"
else
echo "猜小了"
fi
done
