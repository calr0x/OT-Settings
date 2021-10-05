#!/bin/bash


NODERC=.origintrail_noderc

if [[ -f /root/add-pruning.sh ]]; then
    rm /root/add-pruning.sh
fi

if [[ -d /ot-node ]];then
<<<<<<< HEAD
    NODERC_PATH=/ot-node/current/
    
    echo -n "DockSucker install detected, backing up existing config to /root/origintrail_nodrc-BACKUP: "
    OUTPUT=$(cp $NODERC_PATH$NODERC /root/origintrail_nodrc-BACKUP)
=======
    OTPATH=/ot-node/current/
    
    echo -n "DockSucker install detected, backing up existing config to /root/origintrail_noderc-BACKUP: "
    OUTPUT=$(cp $OTPATH$NODERC /root/origintrail_noderc-BACKUP)
>>>>>>> adfdde4ac01195088a44f3514cbfe2015ac6b88d
    if [[ $? -eq 0 ]]; then
        echo -e "${GREEN}SUCCESS${NC}${N1}"
    else
        echo -e "${RED}FAILED${NC}${N1}"
        echo $OUTPUT
        exit 1
    fi

    echo -n "Adding pruning to the noderc: "
    
<<<<<<< HEAD
    jq '.dataset_pruning.enabled=true' /ot-node/current/.origintrail_noderc >> /ot-node/current/origintrail_noderc_temp
    mv /ot-node/current/origintrail_noderc_temp /ot-node/current/.origintrail_noderc
    jq '.dataset_pruning.imported_pruning_delay_in_minutes=1440' /ot-node/current/.origintrail_noderc >> /ot-node/current/origintrail_noderc_temp
    mv /ot-node/current/origintrail_noderc_temp /ot-node/current/.origintrail_noderc
    jq '.dataset_pruning.replicated_pruning_delay_in_minutes=1440' /ot-node/current/.origintrail_noderc >> /ot-node/current/origintrail_noderc_temp
    mv $PATHorigintrail_noderc_temp /ot-node/current/.origintrail_noderc
    jq '.dataset_pruning.low_estimated_value_datasets.enabled=true' /ot-node/current/.origintrail_noderc >> /ot-node/current/origintrail_noderc_temp
    mv /ot-node/current/origintrail_noderc_temp /ot-node/current/.origintrail_noderc
    jq '.dataset_pruning.low_estimated_value_datasets.minimum_free_space_percentage=75' /ot-node/current/.origintrail_noderc >> /ot-node/current/origintrail_noderc_temp
    mv /ot-node/current/origintrail_noderc_temp /ot-node/current/.origintrail_noderc
=======
    jq '.dataset_pruning.enabled=true' $OTPATH.origintrail_noderc >> $OTPATHorigintrail_noderc_temp
    mv $OTPATHorigintrail_noderc_temp $OTPATH.origintrail_noderc
    jq '.dataset_pruning.imported_pruning_delay_in_minutes=1440' $OTPATH.origintrail_noderc >> $OTPATHorigintrail_noderc_temp
    mv $OTPATHorigintrail_noderc_temp $OTPATH.origintrail_noderc
    jq '.dataset_pruning.replicated_pruning_delay_in_minutes=1440' $OTPATH.origintrail_noderc >> $OTPATHorigintrail_noderc_temp
    mv $OTPATHorigintrail_noderc_temp $OTPATH.origintrail_noderc
    jq '.dataset_pruning.low_estimated_value_datasets.enabled=true' $OTPATH.origintrail_noderc >> $OTPATHorigintrail_noderc_temp
    mv $OTPATHorigintrail_noderc_temp $OTPATH.origintrail_noderc
    jq '.dataset_pruning.low_estimated_value_datasets.minimum_free_space_percentage=75' $OTPATH.origintrail_noderc >> $OTPATHorigintrail_noderc_temp
    mv $OTPATHorigintrail_noderc_temp $OTPATH.origintrail_noderc
>>>>>>> adfdde4ac01195088a44f3514cbfe2015ac6b88d
    
    if [[ $? -eq 0 ]]; then
        echo -e "${GREEN}SUCCESS${NC}${N1}"
    else
        echo -e "${RED}FAILED${NC}${N1}"
        echo $OUTPUT
        exit 1
    fi

    echo -n "Pruning successfully added, restarting node and displaying logs to verify pruning started: "
    OUTPUT=$(systemctl restart otnode && journalctl -u otnode -f)
    if [[ $? -eq 0 ]]; then
        echo -e "${GREEN}SUCCESS${NC}${N1}"
    else
        echo -e "${RED}FAILED${NC}${N1}"
        echo $OUTPUT
        exit 1
    fi
else
    OTPATH=/root/

<<<<<<< HEAD
    echo -n "Docker install detected, backing up existing config to /root/origintrail_nodrc-BACKUP: "
    OUTPUT=$(cp $NODERC_PATH$NODERC /root/origintrail_nodrc-BACKUP)
=======
    echo -n "Docker install detected, backing up existing config to /root/origintrail_noderc-BACKUP: "
    OUTPUT=$(cp $OTPATH$NODERC /root/origintrail_noderc-BACKUP)
>>>>>>> adfdde4ac01195088a44f3514cbfe2015ac6b88d
    if [[ $? -eq 0 ]]; then
        echo -e "${GREEN}SUCCESS${NC}${N1}"
    else
        echo -e "${RED}FAILED${NC}${N1}"
        echo $OUTPUT
        exit 1
    fi

    echo -n "Adding pruning to the noderc: "
    
<<<<<<< HEAD
    jq '.dataset_pruning.enabled=true' /root/.origintrail_noderc >> /root/origintrail_noderc_temp
    mv /root/origintrail_noderc_temp /root/.origintrail_noderc
    jq '.dataset_pruning.imported_pruning_delay_in_minutes=1440' /root/.origintrail_noderc >> /root/origintrail_noderc_temp
    mv /root/origintrail_noderc_temp /root/.origintrail_noderc
    jq '.dataset_pruning.replicated_pruning_delay_in_minutes=1440' /root/.origintrail_noderc >> /root/origintrail_noderc_temp
    mv $PATHorigintrail_noderc_temp /root/.origintrail_noderc
    jq '.dataset_pruning.low_estimated_value_datasets.enabled=true' /root/.origintrail_noderc >> /root/origintrail_noderc_temp
    mv /root/origintrail_noderc_temp /root/.origintrail_noderc
    jq '.dataset_pruning.low_estimated_value_datasets.minimum_free_space_percentage=75' /root/.origintrail_noderc >> /root/origintrail_noderc_temp
    mv /root/origintrail_noderc_temp /root/.origintrail_noderc
=======
    jq '.dataset_pruning.enabled=true' $OTPATH.origintrail_noderc >> $OTPATHorigintrail_noderc_temp
    mv $OTPATHorigintrail_noderc_temp $OTPATH.origintrail_noderc
    jq '.dataset_pruning.imported_pruning_delay_in_minutes=1440' $OTPATH.origintrail_noderc >> $OTPATHorigintrail_noderc_temp
    mv $OTPATHorigintrail_noderc_temp $OTPATH.origintrail_noderc
    jq '.dataset_pruning.replicated_pruning_delay_in_minutes=1440' $OTPATH.origintrail_noderc >> $OTPATHorigintrail_noderc_temp
    mv $OTPATHorigintrail_noderc_temp $OTPATH.origintrail_noderc
    jq '.dataset_pruning.low_estimated_value_datasets.enabled=true' $OTPATH.origintrail_noderc >> $OTPATHorigintrail_noderc_temp
    mv $OTPATHorigintrail_noderc_temp $OTPATH.origintrail_noderc
    jq '.dataset_pruning.low_estimated_value_datasets.minimum_free_space_percentage=75' $OTPATH.origintrail_noderc >> $OTPATHorigintrail_noderc_temp
    mv $OTPATHorigintrail_noderc_temp $OTPATH.origintrail_noderc
>>>>>>> adfdde4ac01195088a44f3514cbfe2015ac6b88d
    
    if [[ $? -eq 0 ]]; then
        echo -e "${GREEN}SUCCESS${NC}${N1}"
    else
        echo -e "${RED}FAILED${NC}${N1}"
        echo $OUTPUT
        exit 1
    fi

    echo -n "Pruning successfully added, restarting node and displaying logs to verify pruning started: "
    OUTPUT=$(docker restart otnode && docker logs otnode -f)
    if [[ $? -eq 0 ]]; then
        echo -e "${GREEN}SUCCESS${NC}${N1}"
    else
        echo -e "${RED}FAILED${NC}${N1}"
        echo $OUTPUT
        exit 1
    fi
fi
