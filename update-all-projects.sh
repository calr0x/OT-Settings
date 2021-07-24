#!/bin/bash
N1=$'\n'

if [ -d "/root/OT-Ansible-Files-and-Playbooks" ]; then
    echo "UPDATING: OT-Ansible-Files-and-Playbooks"
    (cd /root/OT-Ansible-Files-and-Playbooks && git pull) 2>/dev/null
else
    echo "OT-Ansible-Files-and-Playbooks not found, skipping${N1}${N1}"
fi

if [ -d "/root/OT-Settings" ]; then
    echo "UPDATING: OT-Settings"
    (cd /root/OT-Settings && git pull) 2>/dev/null
else
    echo "OT-Settings not found, skipping (this is probably not a good thing that it's missing)${N1}${N1}"
fi

if [ -d "/root/OT-NodeWatch" ]; then
    echo "UPDATING: OT-NodeWatch"
    (cd /root/OT-NodeWatch && git pull) 2>/dev/null
else
    echo "OT-NodeWatch not found, skipping${N1}${N1}"
fi

if [ -d "/root/OT-Smoothbrain-Backup" ]; then
    echo "UPDATING: OT-Smoothbrain-Backup"
    (cd /root/OT-Smoothbrain-Backup && git pull) 2>/dev/null
else
    echo "OT-Smoothbrain-Backup not found, skipping${N1}${N1}"
fi

if [ -d "/root/OT-DockSucker" ]; then
    echo "UPDATING: OT-DockSucker"
    (cd /root/OT-DockSucker && git pull) 2>/dev/null
else
    echo "OT-DockSucker not found, skipping${N1}${N1}"
fi