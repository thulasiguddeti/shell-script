#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE 'tmp|File')
DISK_THRESHOLD=1

message=""

while IFS= read line
do

    usage=$(echo $line | awk '{print$6F}' | cut -d % -f1)
    partition=$(echo $line | awk '{print$1F}')
    if [ $usage -ge $DISK_THRESHOLD ]
    then
        message+="High Disk Usage on $partition: $usage <br>"
    fi 

done <<< $DISK_USAGE

echo -e "Message: $message" 

#echo "$message" | mail -s "High disk Usage:" thulasiguddeti06@gmail.com 
sh mail.sh "DevOps Team" "High Disk usage" "$message" "thulasiguddeti02@gmail.com" "ALERT HIGH DISK USAGE"