#!/bin/bash
for i in 192.168.1.{1..254}
do
ping -c 3 -i 0.2 -W 1 192.168.1.$i &> /dev/null
if test $? == 0;then
echo "通了"
else
echo "不通"
fi
done
