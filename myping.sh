#!/bin/bash
function myping {
ping -c 10000 -i 0.1 -W 1  $1
if [ $? -eq 0 ];then
let x++
echo "$1 is up,$x台通了"
else
let y++
echo "$1 is down,$y台不通"
fi
}
for i in 176.130.6.{1..254}
do
myping  $i &
done
wait

