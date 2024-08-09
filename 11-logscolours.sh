#!/bin/bash
ID=$(id -u) 
TIMESTAMP=$(date +%F-%H-%M-%S)

R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "Error ::  $2 .... $R failed $N"
        exit 1
    else
        echo " $2..... $G success $N"
    fi 
}
if [ $ID -ne 0 ]
then
    echo -e "$R Error :: Please run the script with root access $N"
    exit 1 # you can give other than zero
else
    echo "Your are a root user"
fi # it indicates if condition ends here.

yum install mysql -y &>> $LOGFILE

VALIDATE $?  "Installing mysql"

yum install git -y  &>> $LOGFILE

VALIDATE  $?  "Installing Git"
