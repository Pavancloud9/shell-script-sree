#!/bin/bash

# for I in {0..90}
# do
#     echo $I
# done

VALIDATE(){
    if [ $? -ne 0 ]
then
    echo "Installing $INSTALL_SOFTWARE.....FAILURE"
else
    echo "Installing $INSTALL_SOFTWARE.....SUCCESS"
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
    echo "Installing $INSTALL_SOFTWARE....ALREADY INSTALLED"
fi
done