#!/bin/bash
while inotifywait -rqq  /opt
do
rsync  -a  --delete  /mnt/  /opt
done
