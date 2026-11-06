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

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if [ -n "$FILES" ]
then
    echo "Files are:: $FILES"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"  #### ZIP FILE NAME
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
    if [ -f $ZIP_FILE ]
then
    echo "zip file created successfully"

    while read -r FILES
    do
        echo "Files to be deleted are:: $FILES
        # rm -rf $FILES
        # echo "deleted file: $FILES"
    done < $FILES

else
    echo "Failed to create zip file"
    exit 1
fi
    echo "No files found to zip"
fi






