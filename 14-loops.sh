#!/bin/bash

# for I in {0..90}
# do
#     echo $I
# done

VALIDATE(){
    if [ $1 -ne 0 ]
then
    echo "Installing $2....FAILURE"
else
    echo "Installing $2....SUCCESS"
fi
}

for INSTALL_SOFTWARE in $@
do
    dnf list installed $INSTALL_SOFTWARE
    if [ $? -ne 0 ]
then
    dnf install $INSTALL_SOFTWARE -y
    VALIDATE $? "Installing $INSTALL_SOFTWARE
else
    echo "$INSTALL_SOFTWARE ....ALREADY INSTALLED"
fi
done