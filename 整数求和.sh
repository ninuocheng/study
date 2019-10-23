#!/bin/bash
#seq  100  可以快速自动生成100个整数
sum=0
read  -p  "请输入要求和的整数:"  z
for i in  `seq  $z`
do
   sum=$[sum+i]
done
echo "总和是:$sum"
