#!/bin/bash
for i in `seq 254`
do
ping -c 2 -i 0.1 -W 1 172.25.0.$i &> /dev/null
if [ $? -eq 0 ];then
echo "172.25.0.$i在线"
else
echo "172.25.0.$i不在线"
fi
done
