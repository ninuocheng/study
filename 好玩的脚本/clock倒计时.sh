#!/bin/bash
#功能描述(Description):通过tput定位光标,在屏幕特定位置打印当前的计算机时间.

#使用Ctrl+C中断脚本时显示光标.
trap 'tput cnorm;exit' INT EXIT

#定义数组变量,该数字有9个元素,每行是1个元素,每一个数字占用12列.
#0的数组坐标位置为0-11,1的数组坐标位置为12-23,依此类推.
number=(
'  0000000000      111     2222222222  3333333333 44    44     5555555555  6666666666   777777777   888888888  9999999999 '
'  00      00    11111             22          33 44    44     55          66           77     77   88     88  99      99 '
'  00      00   111111             22          33 44    44     55          66           77     77   88     88  99      99 '
'  00      00       11             22          33 44    44     55          66                  77   88     88  99      99 '
'  00      00       11     2222222222  3333333333 44444444444  5555555555  6666666666          77   888888888  9999999999 '
'  00      00       11     22                  33       44             55  66      66          77   88     88          99 '
'  00      00       11     22                  33       44             55  66      66          77   88     88          99 '
'  00      00       11     22                  33       44             55  66      66          77   88     88          99 '
'  0000000000  1111111111  2222222222  3333333333       44      555555555  6666666666          77   888888888  9999999999 '
)

#获取计算机时间,并分别提取个位和十位数字.
get_time(){
   if [ -z "$1" ];then
       echo "Usage:$0 倒计时分钟"
       exit
   fi
   sec=$[$1*60]
}

#将数组中的某个数组打印出来.
print_time(){
    #从第几个位置开始提取数组元素,0就从0开始,1就从12开始,2就从24开始,依此类推.
    begin=$[$1*12]
    for i in `seq 0 ${#number[@]}`   #0-9的循环.
    do
        tput cup $[i+5] $2
        echo -en "\033[91m${number[i]:$begin:12}\033[0m"
    done
}

#依次打印小时,分钟,秒(个位和十位分别打印).
get_time $1
while :
do
    [ $sec -lt 0 ] && exit
    tput civis    #隐藏光标.
    tput clear
    tput cup 3 16
    echo  "倒计时:"
    for j in `seq ${#sec}`
    do
        num=`echo $sec | cut -c $j`
        y=$[j*16]
        print_time $num $y
    done
    let sec--
    echo
    sleep 1
done

