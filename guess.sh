#!/bin/bash
num=$[RANDOM%100+1]
i=0
while :
do
read -p "随机数1-100,你猜:" guess
let i++
if [ $guess -eq $num ];then
echo "$i次猜对了"
exit
elif [ $guess -gt $num ];then
echo "猜大了"
else
echo "猜小了"
fi
done
