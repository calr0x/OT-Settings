#!/bin/bash

rm testconfig.sh

N1=$'\n'

IFS=''
while read LINE; do
#    echo "$LINE"

    # Detect comment
    if [[ "$LINE" = *\#\#* ]]; then
      echo "$LINE" >> testconfig.sh
      continue
    fi

    # Detect blank line
    COUNT=${#LINE}
#    echo $COUNT
    if [[ "$COUNT" -eq 0 ]]; then
      echo "" >> testconfig.sh
      continue
    fi

    # Detect if value present in users config
    LINE_CHECK="${LINE/=\"[0-Z]*/}"
    echo $LINE_CHECK >> testconfig.sh

done < /root/OT-Settings/config-example.sh