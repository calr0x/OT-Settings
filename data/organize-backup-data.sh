#!/bin/bash

N1=$'\n'
BACKUP=/root/backup

if [ ! -d "/root/backup" ]; then
    mkdir /root/backup
fi

# Find .origintral_noderc

OTNODERC=$(find / -name .origintrail_noderc -type f -printf '%h\n')
OTNODERC_COUNT=$(echo "$OTNODERC" | wc -l)

case "$OTNODERC_COUNT" in
   0)
        echo "No files named .origintrail_noderc were found on this server."
        ;;
   1)
        if [ $OTNODERC == $BACKUP ]; then
            echo ".origintrailnode_rc found in $BACKUP."
        else
            echo "Copying .origintrail_noderc found in $OTNODERC to $BACKUP"
            cp $OTNODERC/.origintrail_noderc /root/backup
        fi
        ;;
   [2-99])
        echo "More than 1 .origintrail_noderc was found in the following locations. Please delete one and retry:"
        echo "$OTNODERC"
        ;;
esac

# Find .origintral_noderc

OTNODERC=$(find / -name .origintrail_noderc -type f -printf '%h\n')
OTNODERC_COUNT=$(echo "$OTNODERC" | wc -l)

case "$OTNODERC_COUNT" in
   0)
        echo "No files named .origintrail_noderc were found on this server."
        ;;
   1)
        if [ $OTNODERC == $BACKUP ]; then
            echo ".origintrailnode_rc found in $BACKUP."
        else
            echo "Copying .origintrail_noderc found in $OTNODERC to $BACKUP"
            cp $OTNODERC/.origintrail_noderc /root/backup
        fi
        ;;
   [2-99])
        echo "More than 1 .origintrail_noderc was found in the following locations. Please delete one and retry:"
        echo "$OTNODERC"
        ;;
esac