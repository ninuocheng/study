#!/bin/bash
x=$(who | wc -l)
[ $x -gt 3 ] && echo "有人入侵服务器!!!!!" | mail -s test root
