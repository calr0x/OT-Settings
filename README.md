# __OT-Settings__
This repository is the core of all other OT related repository. 

Nothing will work if this repository isn't installed, and variables changed.

The config file here will include all variables to run other OT repos. 
```
cd
```
```
git clone https://github.com/calr0x/OT-Settings.git
```
```
cd OT-Settings
```
```
cp config-original.sh config.sh
```
```
nano config.sh
```
Essentially, what we are doing here is make a local copy of the config-original.sh file and name it config.sh. 

You do not want to change config-original.sh since this will be modified every time you want to git pull (aka update) your repository. 

Every change made will be done on config.sh, and every other OT repository will be sourcing from config.sh.

Follow the commented out instructions in the config.sh file and fill up the variables. If you need help, consult the guide below.

## __VARIABLES__
---
This section will cover how to get each variable to put inside config.sh



## Amazon AWS
---
__Getting your S3 Bucket URL__

1. Log in to your Amazon AWS account
2. Go to Buckets
3. Create bucket
4. Choose the name of your bucket and leave the rest as default
5. Your URL is as follows : \
s3:https://s3.amazonaws.com/YOU_BUCKET_NAME
6. Paste this link into config.sh  \
```
export RESTIC_REPOSITORY="s3:https://s3.amazonaws.com/YOU_BUCKET_NAME"
```
7. Select your desired password and put it in 
```
export RESTIC_PASSWORD="REPLACE_WITH_RESTIC_REPOSITORY_PASSWORD"
```

__Getting your AWS Access Key ID and Secret Access Key__

1. Log in to your Amazon AWS account
2. Click on your username on the top right corner
3. Select My Security Credentials
4. Go to Access keys (access key ID and secret access key)
5. Create New Access Key
6. Both keys will be shown, make sure to keep them safely
7. Paste keys to 

```
export AWS_ACCESS_KEY_ID="REPLACE_WITH_AWS_ACCESS_KEY"
export AWS_SECRET_ACCESS_KEY="REPLACE_WITH_AWS_SECRET_ACCESS_KEY"
```

## Telegram notifications
---
__Getting your Telegram bot token__

1. Add @botfather on Telegram
2. Follow the on-screen instructions to create your chat bot
3. Paste the code into \

```
export TELEGRAM_TOKEN="REPLACE_WITH_TELEGRAM_TOKEN"
```

__Getting your chat ID__

1. Add @IDBot 
2. Type /start
3. Type /getid
4. Paste the code into \

```
export CHAT_ID="REPLACE_WITH_TELEGRAM_CHAT_ID"
```
