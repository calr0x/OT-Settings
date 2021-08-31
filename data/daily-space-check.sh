#!/bin/bash

# This script checks disk space of the root partition "/" and alerts when its greater than the threshold that's set (85% default)
# Setting to change:
# TELEGRAM_TOKEN
# CHAT_ID
# To schedule this job in the servers Cron:
# crontab -e
# Press "1" (if asked) to select nano as the editor
# On a new line paste the following:
# 0 0 * * * /root/OT-NodeWatch/disk_check.sh

DISK_CHECK_THRESHOLD=85
TELEGRAM_TOKEN="REPLACE"
CHAT_ID="REPLACE"

# Do not change these variables *
HOST=$(hostname)
URL="https://api.telegram.org/bot$TELEGRAM_TOKEN/sendMessage"
SPACE=$(df -k / | tail -n 1 | awk '{print $5}' | sed 's|%||')
MESSAGE="Disk space is $SPACE% full."

if [ $SPACE -ge $DISK_CHECK_THRESHOLD ]; then
  echo $MESSAGE
  curl -s -d "chat_id=$CHAT_ID&disable_web_page_preview=1&text=$MESSAGE" "$URL" > /dev/null
fi
