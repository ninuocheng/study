#!/bin/bash


for i in `seq 100`

do
    
	a[$i]=$[RANDOM%120]

done

#冒泡排序

for i in `seq 100`

do

	for ((j=$i;j<=100;j++))
   
	do
      
		if [ ${a[$i]} -gt ${a[$j]} ];then

			b=${a[$j]}
	    
			a[$j]=${a[$i]}
	    
			a[$i]=$b
	
		fi
   
	done

done


for i in `seq 100`

do
   
	echo -n ${a[$i]}" "

done

echo 

