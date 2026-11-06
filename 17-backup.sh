#!/bin/bash

LOGS_FOLDER="/var/log/shell-script-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date "+%Y-%m-%d_%H:%M:%S")
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:- 14}

USAGE(){
    echo "USAGE:: 17-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS>optional"
    exit 1
}

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR does not exists..pls check"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then
    echo "$DEST_DIR does not exists..pls check"
    exit 1
fi


