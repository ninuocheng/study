#!/bin/bash
#批量修改扩展名,通过位置变量$1、$2提供更灵活的脚本
for i in $(ls *.$1)
do
mv $i ${i%.*}.$2
done
