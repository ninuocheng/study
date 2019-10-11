#!/bin/bash
for i in `seq 100`
do
#[ $i -eq 1 ] && exit
#[ $i -eq 1 ] && break
[ $i -eq 1 ] && continue
done
echo $i
echo "Game Over"
