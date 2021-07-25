#!/bin/bash

IFS=$'\n' # make newlines the only separator
for j in $(cat /root/OT-Settings/config-example.sh)
do
    echo "$j"
done
