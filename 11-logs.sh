#!/bin/bash
ID=$(id -u) 
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "Error ::  $2 .... is failed"
        exit 1
    else
        echo " $2..... is success"
    fi 
}
if [ $ID -ne 0 ]
then
    echo "Error :: Please run the script with root access"
    exit 1 # you can give other than zero
else
    echo "Your are a root user"
fi # it indicates if condition ends here.

yum install mysql -y &>> $LOGFILE

VALIDATE $?  "Installing mysql"

yum install git -y  &>> $LOGFILE

VALIDATE  $?  "Installing Git"
