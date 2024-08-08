#!/bin/bash
ID=$(id -u)
VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo "Error :: Installing is failed"
        exit 1
    else
        echo "Installing is success"
    fi 
}
if [ $ID -ne 0 ]
then
    echo "Error :: Please run the script with root acess"
    exit 1 # you can give other than zero
else
    echo "Your are a root user"
fi # it indicates if condition ends here.

yum install mysql -y 

VALIDATE 

yum install git -y

VALIDATE
