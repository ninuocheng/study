#!/bin/bash
cd /var/log
sum=0
for i in `ls -r *`
do
   if [ -f $i ];then
   let sum++
   echo "文件名:$i"
   fi
done
echo "总文件数量是:$sum"
