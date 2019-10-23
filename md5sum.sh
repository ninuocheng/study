#!/bin/bash
for i in $(ls /etc/*.conf)
    md5sum  $i  >> /var/log/conf_file.log
    done
