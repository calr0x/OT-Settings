#!/bin/bash

N1=$'\n'
BACKUP=/root/backup

if [[ ! -d "/root/backup" ]]; then
    mkdir /root/backup
fi

# Find .origintral_noderc

OTNODE_FILENAME=.origintrail_noderc
OTNODERC=$(find /root -name $OTNODE_FILENAME -type f ! -path "/root/.origintrail_noderc/*")
OTNODERC_COUNT=$(echo "$OTNODERC" | wc -l)

case "$OTNODERC_COUNT" in
   0)
        echo "No files named $OTNODE_FILENAME were found on this server."
        ;;
   1)
        if [[ $OTNODERC == $BACKUP ]]; then
            echo "$OTNODE_FILENAME found in $BACKUP."
        else
            echo "Copying $OTNODE_FILENAME found in $OTNODERC to $BACKUP"
            mv $OTNODERC /root/backup
        fi
        ;;
   [2-99])
        echo "More than 1 $OTNODE_FILENAME was found in the following locations. Please delete one and retry:"
        echo "$OTNODERC"
        ;;
esac

# Find houston.txt

HOUSTON_FILENAME=houston.txt
HOUSTON=$(find /root -name $HOUSTON_FILENAME -type f ! -path "/root/.origintrail_noderc/*")
HOUSTON_COUNT=$(echo "$HOUSTON" | wc -l)

case "$HOUSTON_COUNT" in
   0)
        echo "No files named $HOUSTON_FILENAME were found on this server."
        ;;
   1)
        if [[ $HOUSTON == $BACKUP ]]; then
            echo "$HOUSTON_FILENAME found in $BACKUP."
        else
            echo "Copying $HOUSTON_FILENAME found in $HOUSTON to $BACKUP"
            mv $HOUSTON /root/backup
        fi
        ;;
   [2-99])
        echo "More than 1 $HOUSTON_FILENAME was found in the following locations. Please delete one and retry:"
        echo "$HOUSTON"
        ;;
esac

# Find identity.json

IDENTITY_FILENAME=identity.json
IDENTITY=$(find /root -name $IDENTITY_FILENAME -type f ! -path "/root/.origintrail_noderc/*")
IDENTITY_COUNT=$(echo "$IDENTITY" | wc -l)

case "$IDENTITY_COUNT" in
   0)
        echo "No files named $IDENTITY_FILENAME were found on this server."
        ;;
   1)
        if [[ $IDENTITY == $BACKUP ]]; then
            echo "$IDENTITY_FILENAME found in $BACKUP."
        else
            echo "Copying $IDENTITY_FILENAME found in $IDENTITY to $BACKUP"
            mv $IDENTITY /root/backup
        fi
        ;;
   [2-99])
        echo "More than 1 $IDENTITY_FILENAME was found in the following locations. Please delete one and retry:"
        echo "$IDENTITY"
        ;;
esac

# Find KADEMLIA.crt

KADEMLIA_FILENAME=kademlia.crt
KADEMLIA=$(find /root -name $KADEMLIA_FILENAME -type f ! -path "/root/.origintrail_noderc/*")
KADEMLIA_COUNT=$(echo "$KADEMLIA" | wc -l)

case "$KADEMLIA_COUNT" in
   0)
        echo "No files named $KADEMLIA_FILENAME were found on this server."
        ;;
   1)
        if [[ $KADEMLIA == $BACKUP ]]; then
            echo "$KADEMLIA_FILENAME found in $BACKUP."
        else
            echo "Copying $KADEMLIA_FILENAME found in $KADEMLIA to $BACKUP"
            mv $KADEMLIA /root/backup
        fi
        ;;
   [2-99])
        echo "More than 1 $KADEMLIA_FILENAME was found in the following locations. Please delete one and retry:"
        echo "$KADEMLIA"
        ;;
esac

# Find kademlia.key

KADEMLIA_KEY_FILENAME=kademlia.key
KADEMLIA_KEY=$(find /root -name $KADEMLIA_KEY_FILENAME -type f ! -path "/root/.origintrail_noderc/*")
KADEMLIA_KEY_COUNT=$(echo "$KADEMLIA_KEY" | wc -l)

case "$KADEMLIA_KEY_COUNT" in
   0)
        echo "No files named $KADEMLIA_KEY_FILENAME were found on this server."
        ;;
   1)
        if [[ $KADEMLIA_KEY == $BACKUP ]]; then
            echo "$KADEMLIA_KEY_FILENAME found in $BACKUP."
        else
            echo "Copying $KADEMLIA_KEY_FILENAME found in $KADEMLIA_KEY to $BACKUP"
            mv $KADEMLIA_KEY /root/backup
        fi
        ;;
   [2-99])
        echo "More than 1 $KADEMLIA_KEY_FILENAME was found in the following locations. Please delete one and retry:"
        echo "$KADEMLIA_KEY"
        ;;
esac

# Find system.db

SYSTEMDB_FILENAME=system.db
SYSTEMDB=$(find /root -name $SYSTEMDB_FILENAME -type f ! -path "/root/.origintrail_noderc/*")
SYSTEMDB_COUNT=$(echo "$SYSTEMDB" | wc -l)

case "$SYSTEMDB_COUNT" in
   0)
        echo "No files named $SYSTEMDB_FILENAME were found on this server."
        ;;
   1)
        if [[ $SYSTEMDB == $BACKUP ]]; then
            echo "$SYSTEMDB_FILENAME found in $BACKUP."
        else
            echo "Copying $SYSTEMDB_FILENAME found in $SYSTEMDB to $BACKUP"
            mv $SYSTEMDB /root/backup
        fi
        ;;
   [2-99])
        echo "More than 1 $SYSTEMDB_FILENAME was found in the following locations. Please delete one and retry:"
        echo "$SYSTEMDB"
        ;;
esac

# Find xdai_erc725_identity.json

XDAI_IDENTITY_FILENAME=xdai_erc725_identity.json
XDAI_IDENTITY=$(find /root -name $XDAI_IDENTITY_FILENAME -type f ! -path "/root/.origintrail_noderc/*")
XDAI_IDENTITY_COUNT=$(echo "$XDAI_IDENTITY" | wc -l)

case "$XDAI_IDENTITY_COUNT" in
   0)
        echo "No files named $XDAI_IDENTITY_FILENAME were found on this server."
        ;;
   1)
        if [[ $XDAI_IDENTITY == $BACKUP ]]; then
            echo "$XDAI_IDENTITY_FILENAME found in $BACKUP."
        else
            echo "Copying $XDAI_IDENTITY_FILENAME found in $XDAI_IDENTITY to $BACKUP"
            mv $XDAI_IDENTITY /root/backup
        fi
        ;;
   [2-99])
        echo "More than 1 $XDAI_IDENTITY_FILENAME was found in the following locations. Please delete one and retry:"
        echo "$XDAI_IDENTITY"
        ;;
esac

# Find arangodb

ARANGODB_FILENAME=arangodb
ARANGODB=$(find /root -name $ARANGODB_FILENAME -type d  ! -path "/root/.origintrail_noderc/*")
ARANGODB_COUNT=$(echo "$ARANGODB" | wc -l)

case "$ARANGODB_COUNT" in
   0)
        echo "No files named $ARANGODB_FILENAME were found on this server."
        ;;
   1)
        if [[ $ARANGODB == $BACKUP ]]; then
            echo "$ARANGODB_FILENAME found in $BACKUP."
        else
            echo "Copying $ARANGODB_FILENAME found in $ARANGODB to $BACKUP"
            mv  $ARANGODB /root/backup
        fi
        ;;
   [2-99])
        echo "More than 1 $ARANGODB_FILENAME was found in the following locations. Please delete one and retry:"
        echo "$ARANGODB"
        ;;
esac

# Find migrations

MIGRATIONS_FILENAME=migrations
MIGRATIONS=$(find /root -name $MIGRATIONS_FILENAME -type d  ! -path "/root/.origintrail_noderc/*")
MIGRATIONS_COUNT=$(echo "$MIGRATIONS" | wc -l)

case "$MIGRATIONS_COUNT" in
   0)
        echo "No files named $MIGRATIONS_FILENAME were found on this server."
        ;;
   1)
        if [[ $MIGRATIONS == $BACKUP ]]; then
            echo "$MIGRATIONS_FILENAME found in $BACKUP."
        else
            echo "Copying $MIGRATIONS_FILENAME found in $MIGRATIONS to $BACKUP"
            mv  $MIGRATIONS /root/backup
        fi
        ;;
   [2-99])
        echo "More than 1 $MIGRATIONS_FILENAME was found in the following locations. Please delete one and retry:"
        echo "$MIGRATIONS"
        ;;
esac
