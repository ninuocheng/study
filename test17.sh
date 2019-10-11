#!/bin/bash
x=$[RANDOM%10]
for i in `seq 3`
do
read -p "请输入一个数字(0-9)" n
if [ $n == $x ];then
echo "恭喜你猜对了!"
exit
elif [ $n -gt $x ];then
echo "你猜大了"
else
echo "猜小了"
fi
done
