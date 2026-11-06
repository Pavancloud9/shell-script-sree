#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS="${3:-14}"

if [ $# -lt 2 ]
then
    echo "USAGE:: sh <SOURCE_DIR> <DEST_DIR> <DAYS>Optional"
    exit 1
fi

