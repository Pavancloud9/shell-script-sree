#!/bin/bash

MSG="SCRIPT1"
GREET="Hi from script1"
source ./20-script2.sh

echo "Hello from: $MSG"

sh 20-script2.sh