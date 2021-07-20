#!/bin/bash

if [ -d "/root/OT-Ansible-Files-and-Playbooks" ]; then
    echo "Updating OT-Ansible-Files-and-Playbooks"
    (cd /root/OT-Ansible-Files-and-Playbooks && git pull) 2>/dev/null
else
    echo "OT-Ansible-Files-and-Playbooks not found, skipping"
fi

if [ -d "/root/OT-Settings" ]; then
    echo "Updating OT-Settings"
    (cd /root/OT-Settings && git pull) 2>/dev/null
else
    echo "OT-Settings not found, skipping (this is probably not a good thing that it's missing)"
fi

if [ -d "/root/OT-NodeWatch" ]; then
    echo "Updating OT-NodeWatch"
    (cd /root/OT-NodeWatch && git pull) 2>/dev/null
else
    echo "OT-NodeWatch not found, skipping"
fi

if [ -d "/root/OT-Smoothbrain-Backup" ]; then
    echo "Updating OT-Smoothbrain-Backup"
    (cd /root/OT-Smoothbrain-Backup && git pull) 2>/dev/null
else
    echo "OT-Smoothbrain-Backup not found, skipping"
fi

if [ -d "/root/OT-DockSucker" ]; then
    echo "Updating OT-DockSucker"
    (cd /root/OT-DockSucker && git pull) 2>/dev/null
else
    echo "OT-DockSucker not found, skipping"
fi