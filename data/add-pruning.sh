#!/bin/bash


NODERC=.origintrail_noderc

if [[ -d /ot-node ]];then
    OTPATH=/ot-node/current/
    
    echo -n "DockSucker install detected, backing up existing config to /root/origintrail_noderc-BACKUP: "
    OUTPUT=$(cp $OTPATH$NODERC /root/origintrail_noderc-BACKUP)
    if [[ $? -eq 0 ]]; then
        echo -e "${GREEN}SUCCESS${NC}${N1}"
    else
        echo -e "${RED}FAILED${NC}${N1}"
        echo $OUTPUT
        exit 1
    fi

    echo -n "Adding pruning to the noderc: "
    
    jq '.dataset_pruning.enabled=true' $PATH.origintrail_noderc >> $PATHorigintrail_noderc_temp
    mv $PATHorigintrail_noderc_temp $PATH.origintrail_noderc
    jq '.dataset_pruning.imported_pruning_delay_in_minutes=1440' $PATH.origintrail_noderc >> $PATHorigintrail_noderc_temp
    mv $PATHorigintrail_noderc_temp $PATH.origintrail_noderc
    jq '.dataset_pruning.replicated_pruning_delay_in_minutes=1440' $PATH.origintrail_noderc >> $PATHorigintrail_noderc_temp
    mv $PATHorigintrail_noderc_temp $PATH.origintrail_noderc
    jq '.dataset_pruning.low_estimated_value_datasets.enabled=true' $PATH.origintrail_noderc >> $PATHorigintrail_noderc_temp
    mv $PATHorigintrail_noderc_temp $PATH.origintrail_noderc
    jq '.dataset_pruning.low_estimated_value_datasets.minimum_free_space_percentage=75' $PATH.origintrail_noderc >> $PATHorigintrail_noderc_temp
    mv $PATHorigintrail_noderc_temp $PATH.origintrail_noderc
    
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

    echo -n "Docker install detected, backing up existing config to /root/origintrail_noderc-BACKUP: "
    OUTPUT=$(cp $OTPATH$NODERC /root/origintrail_noderc-BACKUP)
    if [[ $? -eq 0 ]]; then
        echo -e "${GREEN}SUCCESS${NC}${N1}"
    else
        echo -e "${RED}FAILED${NC}${N1}"
        echo $OUTPUT
        exit 1
    fi

    echo -n "Adding pruning to the noderc: "
    
    jq '.dataset_pruning.enabled=true' $PATH.origintrail_noderc >> $PATHorigintrail_noderc_temp
    mv $PATHorigintrail_noderc_temp $PATH.origintrail_noderc
    jq '.dataset_pruning.imported_pruning_delay_in_minutes=1440' $PATH.origintrail_noderc >> $PATHorigintrail_noderc_temp
    mv $PATHorigintrail_noderc_temp $PATH.origintrail_noderc
    jq '.dataset_pruning.replicated_pruning_delay_in_minutes=1440' $PATH.origintrail_noderc >> $PATHorigintrail_noderc_temp
    mv $PATHorigintrail_noderc_temp $PATH.origintrail_noderc
    jq '.dataset_pruning.low_estimated_value_datasets.enabled=true' $PATH.origintrail_noderc >> $PATHorigintrail_noderc_temp
    mv $PATHorigintrail_noderc_temp $PATH.origintrail_noderc
    jq '.dataset_pruning.low_estimated_value_datasets.minimum_free_space_percentage=75' $PATH.origintrail_noderc >> $PATHorigintrail_noderc_temp
    mv $PATHorigintrail_noderc_temp $PATH.origintrail_noderc
    
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
