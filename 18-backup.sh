#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS="${3:-14}"

if [ $# -lt 2 ]
then
    echo "USAGE:: sh <SOURCE_DIR> <DEST_DIR> <DAYS>Optional"
    exit 1
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR does not exists...pls check"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then
    echo "$DEST_DIR does not exists...pls check"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if [ -n "$FILES" ]
then
    echo "Files are:: $FILES"
else
    echo "No files to zip"