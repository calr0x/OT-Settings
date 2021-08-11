#!/bin/bash

N1=$'\n'
BEFORE_SPACE=$(df -h | grep "sda1\s" | tr -s " " " " | cut -d" " -f3 | tr -d 'G')

echo "${N1}Current used disk space is: $BEFORE_SPACE Gb."

echo "${N1}Removing journal entries older than an hour"
OUTPUT=$(journalctl --vacuum-time=1h 2>&1)

echo "${N1}Setting the journal limit in the future to 50Mb"
OUTPUT=$(sed -i 's|#SystemMaxUse=|SystemMaxUse=50M|' /etc/systemd/journald.conf)

if [[ ! -d "/ot-node" ]]; then
  echo "${N1}Deleting docker backup folder contents"
  OUTPUT=$(docker exec it otnode sh -c rm -rf ../backup/*)
  
  echo "${N1}Deleting docker logs"
  OUTPUT=$(truncate -s 0 $(docker inspect -f '{{.LogPath}}' otnode))
  
  #echo "${N1}Settings docker log file max size to 50Mb"
  #OUTPUT=$(docker create -i --log-driver json-file --log-opt max-size=50m)
else
  echo "${N1}Deleting node backup folder contents"
  rm -rf /ot-node/backup/*
  
  echo "${N1}Deleting /root/backup contents"
  OUTPUT=$(rm -rf /root/backup/*)
fi

echo "${N1}Deleting archived logs"
OUTPUT=$(find /var/log -type f -regex ".*\.gz$")
OUTPUT=$(find /var/log -type f -regex ".*\.[0-9]$")

echo "${N1}Running apt clean"
OUTPUT=$(apt clean -y 2>&1)
echo "${N1}Running apt autoremove"
OUTPUT=$(apt autoremove -y 2>&1)

#Docker:
#Delete previous node versions (check what version they have 1st)

AFTER_SPACE=$(df -h | grep "sda1\s" | tr -s " " " " | cut -d" " -f3 | tr -d 'G')

echo "${N1}Disk space after cleaning is $AFTER_SPACE Gb."
echo "${N1}Total space cleaned is $((BEFORE_SPACE-AFTER_SPACE)) Gb."
