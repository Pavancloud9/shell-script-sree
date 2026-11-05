#/bin/bash

SOURCE_DIR=$1

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)

echo "Files older than 14days are:: $FILES_TO_DELETE"

while read -r FILE
do
    echo "Deleting file: $FILE"
done < $FILES_TO_DELETE