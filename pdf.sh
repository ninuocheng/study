#!/bin/bash
url="http://www.baidu.com/"
echo  "开始下载..."
sleep 2
type=jpg
for i in `seq 100`
   	echo "正在下载$i.$type"
	curl $url/$i.$type -o /tmp/${i}$type
   	sleep 1
done
#curl 使用-o 选项指定下载文件另存到哪里
