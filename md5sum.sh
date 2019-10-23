#!/bin/bash
for i in $(ls /etc/*.conf)
do
    md5sum  $i  >> /var/log/conf_file.log
done
