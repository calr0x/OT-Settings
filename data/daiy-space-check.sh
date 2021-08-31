#!/bin/bash

# This script checks disk space of /dev/sda and alerts when its greater than the threshold that's set (90% default)
# Setting to change in OT-Settings/config.sh:
# SPACE_THRESHOLD: Set this to what percentage it should alert above.
#
# To schedule this job in the servers Cron:
# crontab -e
# Press "1" (if asked) to select nano as the editor
# On a new line paste the following:
# 0 0 * * * /root/OT-NodeWatch/disk_check.sh

TELEGRAM_TOKEN="REPLACE_WITH_TELEGRAM_TOKEN"
CHAT_ID="REPLACE_WITH_TELEGRAM_CHAT_ID"
HOST=$(hostname)
URL="https://api.telegram.org/bot$TELEGRAM_TOKEN/sendMessage"

SPACE=$(df -k / | tail -n 1 | awk '{print $5}' | sed 's|%||')

MESSAGE="Disk space is $SPACE% full."

curl -s -d "chat_id=$CHAT_ID&disable_web_page_preview=1&text=$MESSAGE" "$URL" > /dev/null
if [ $SPACE -ge $DISK_CHECK_THRESHOLD ]; then
  echo "It's full!"
fi
