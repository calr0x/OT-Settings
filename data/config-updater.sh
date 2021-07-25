#!/bin/bash

N1=$'\n'

IFS=''
while read LINE; do
#    echo "$LINE"

    # Detect comment
    if [[ "$LINE" = *\#\#* ]]; then
      echo "Comment detected"
      echo "$LINE" >> testconfig.sh
    fi

    # Detect blank line
    COUNT=${#LINE}
    echo $COUNT
    if [[ "$COUNT" -eq 0 ]]; then
      echo "$LINE"
      echo "${N1}" >> testconfig.sh
    fi

    # Detect if value present in users config
    LINE_CHECK="${LINE//=\"[A-Z]*\"/}"
    echo $LINE_CHECK

done < /root/OT-Settings/config-example.sh