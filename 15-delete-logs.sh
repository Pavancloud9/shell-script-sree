#/bin/bash

SOURCE_DIR=$@

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)

echo "Files older than 14days are:: $FILES_TO_DELETE"