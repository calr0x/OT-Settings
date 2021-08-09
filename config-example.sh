####################################################
## THIS SECTION IS USED BY THE FOLLOWING PROJECTS: #
##                                                 #
## OT-SMOOTHBRAIN-BACKUP                           #
## OT-DOCKSUCKER                                   #
####################################################

## RESTIC_REPOSITORY = S3 or B2 bucket url or sftp address
## S3 example: s3:https://s3.amazonaws.com/bucketname
## B2 example: b2:bucketname:path/to/repo
## Sftp example: sftp:root@1.1.1.1:/path/to/backup/directory

export RESTIC_REPOSITORY="REPLACE_WITH_S3_OR_B2_BUCKET_URL_OR_SFTP"
export RESTIC_PASSWORD="REPLACE_WITH_RESTIC_REPOSITORY_PASSWORD_OF_YOUR_CHOICE"

## Edit EITHER the AWS or B2 credentials with your keys
## Do not enter values for both S3/B2 entries. You can only do one of them

export AWS_ACCESS_KEY_ID="REPLACE_WITH_AWS_ACCESS_KEY"
export AWS_SECRET_ACCESS_KEY="REPLACE_WITH_AWS_SECRET_ACCESS_KEY"

export B2_ACCOUNT_ID="REPLACE_WITH_B2_ACCOUNT_ID"
export B2_ACCOUNT_KEY="REPLACE_WITH_B2_ACCOUNT_KEY"

####################################################
## THIS SECTION IS USED BY THE FOLLOWING PROJECTS: #
##                                                 #
## OT-SMOOTHBRAIN-BACKUP                           #
## OT-NODEWATCH                                    #
####################################################

export TELEGRAM_TOKEN="REPLACE_WITH_TELEGRAM_TOKEN"
export CHAT_ID="REPLACE_WITH_TELEGRAM_CHAT_ID"
export SMOOTHBRAIN_NOTIFY_ON_SUCCESS="true"
export LOCAL_BACKUP_SERVER="ADD_SERVER_IP_OR_DOMAIN_HERE"

####################################################
## THIS SECTION IS USED BY THE FOLLOWING PROJECTS: #
##                                                 #
## OT-NODEWATCH                                    #
####################################################

## BID_CHECK_JOB_NOTIFY_ENABLED:     Set to false to disable bid notifications (default true)
## BID_CHECK_INTERVAL:               Set this to how far back to search the log for mentions of "Accepting" (default 1 hour).

## This value should match the CRON schedule. For example, Every 1 hour
## CRON should run this script which checks the logs for the past 1 hour.

BID_CHECK_INTERVAL="1 hour ago"
BID_CHECK_INTERVAL_DOCKER="1h"
BID_CHECK_JOB_NOTIFY_ENABLED="true"

## SPACE_THRESHOLD:                  Set this to what percentage it should alert above (default 90%).

DISK_CHECK_THRESHOLD="90"