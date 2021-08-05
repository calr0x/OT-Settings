#!/bin/bash

N1=$'\n'
BACKUP=/root/backup
ERROR_CODE=0

if [[ ! -d "$BACKUP" ]]; then
    mkdir $BACKUP
fi

# find .origintrail_noderc

OTNODE_FILENAME=.origintrail_noderc
OTNODERC=$(find -L /root -name $OTNODE_FILENAME -type f ! -path "/root/.origintrail_noderc/*" -printf '%h\n')
OTNODERC_COUNT=$(echo $OTNODERC | wc -l)

case "$OTNODERC_COUNT" in
   0)
        echo "No files named $OTNODE_FILENAME were found on this server."
        let ERROR_CODE=1
        ;;
   1)
        if [[ $OTNODERC == "" ]]; then
          echo "No files named $OTNODE_FILENAME were found on this server."
          let ERROR_CODE=1
        else
          if [[ $OTNODERC == $BACKUP ]]; then
            echo "$OTNODE_FILENAME found in $BACKUP."
          else
            echo "Copying $OTNODE_FILENAME found in $OTNODERC to $BACKUP"
            mv $OTNODERC/$OTNODE_FILENAME /root/backup
          fi
        fi
        ;;
   [2-99])
        echo "**More than 1 $OTNODE_FILENAME was found in the following locations. Please delete one and retry:**"
        echo "$OTNODERC${N1}"
        let ERROR_CODE=1
        ;;
esac