#!/bin/bash

N1=$'\n'
BEFORE_SPACE=$(df -h | grep "sda1\s" | tr -s " " " " | cut -d" " -f3 | tr -d 'G')

echo "Current used disk space is: $BEFORE_SPACE Gb."

echo "Removing journal entries older than an hour"
journalctl --vacuum-time=1h
echo "Setting the journal limit in the future to 50Mb"
sed -i 's|#SystemMaxUse=|SystemMaxUse=50M|' /etc/systemd/journald.conf

if [[ -d "/root/backup" ]] || [[ -L /root/backup ]]; then
  echo "Deleting /root/backup"
  rm -rf /root/backup
fi

if [[ ! -d "/ot-node" ]]; then
  echo "Deleting docker backup folder contents"
  docker exec it otnode sh -c rm -rf ../backup/*
  echo "Deleting docker logs"
  truncate -s 0 $(docker inspect -f '{{.LogPath}}' otnode)
  echo "Settings docker log file max size to 50Mb"
  docker create -i --log-driver json-file --log-opt max-size=50m
fi

echo "Deleting archived logs"
find /var/log -type f -regex ".*\.gz$"
find /var/log -type f -regex ".*\.[0-9]$"

echo "Running apt clean"
apt clean -y
echo "Running apt autoremove"
apt autoremove -y

#Docker:
#Delete previous node versions (check what version they have 1st)

AFTER_SPACE=$(df -h | grep "sda1\s" | tr -s " " " " | cut -d" " -f3 | tr -d 'G')

echo "Disk space after cleaning is $AFTER_SPACE Gb."
echo "Total space cleaned is $(($BEFORE_SPACE-$AFTER_SPACE)) Gb."
