#!/bin/bash
myping(){
    ping -c1 -W1  $1  &>/dev/null
    if [ $? -eq 0 ];then
        echo $1 >> /root/listIP.txt
    else
        continue
    fi
}

rm -rf /root/listIP.txt
for i in 74 76 93 43 92
do
	myping 176.130.9.$i &
done

ls /root/.ssh/id_rsa &> /dev/null
if [ $? -eq 0 ];then
        rm -rf /root/.ssh/id_rsa
        ssh-keygen -f /root/.ssh/id_rsa -N ''
for i in `cat /root/listIP.txt`
do
#sshpass -p 'Taren1.bgsn' ssh-copy-id -o StrictHostKeyChecking=no $i
expect << EOF
spawn ssh-copy-id -o StrictHostKeyChecking=no $i
expect "password:" { send "123456\r" }
expect "password:" { send "123456\r" } 
EOF
done
else
        ssh-keygen -f /root/.ssh/id_rsa -N ''
for i in `cat /root/listIP.txt`
do
#sshpass -p 'Taren1.bgsn' ssh-copy-id -o StrictHostKeyChecking=no $i
expect << EOF
spawn ssh-copy-id -o StrictHostKeyChecking=no $i
expect "password:" { send "123456\r" }
expect "password:" { send "123456\r" } 
EOF
done
fi

for i in `cat /root/listIP.txt`
do
scp /root/002330a3cc75e3162362a1d2e9f37195.jpg root@$i:/root/
expect << EOF
spawn ssh -o StrictHostKeyChecking=no root@$i
expect "#" { send "chattr -i /var/lib/libvirt/images/tedu-wallpaper-01.png\r" } 
expect "#" { send "mv /var/lib/libvirt/images/tedu-wallpaper-01.png /var/lib/libvirt/images/tedu-wallpaper-01_bak.png\r" } 
expect "#" { send "mv /root/002330a3cc75e3162362a1d2e9f37195.jpg /var/lib/libvirt/images/tedu-wallpaper-01.png\r" } 
expect "#" { send "exit\r" } 
expect "#" { send "exit\r" } 
EOF
done
