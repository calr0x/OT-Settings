#!/bin/bash

source "/root/OT-Settings/config.sh"

HOST=$(hostname)
MESSAGE="${HOST^}, $NODE7: $1"
URL="https://api.telegram.org/bot$TELEGRAM_TOKEN/sendMessage"

curl -s -d "chat_id=$CHAT_ID&disable_web_page_preview=1&text=$MESSAGE" "$URL" > /dev/null