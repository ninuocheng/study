#!/bin/bash
sum=0
while :
do
read -p "请输入整数(0表示结束) :" x
   [ $x -eq 0 ] && break
  let sum+=x 
  #sum=$[sum+x]
  #sum=$[$sum+$x]
done
echo "总和是:$sum"
