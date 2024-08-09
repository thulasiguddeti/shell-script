#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"
echo "script started executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 ...$R FAILED $N"
    else 
        echo -e "$2 ...$G SUCCESS $N"
    fi   
}

if [ $ID -ne 0 ]
then
    echo -e "$R Error :: Please run the script with root acess $N"
    exit 1 # you can give other than zero
else
    echo "Your are a root user"
fi # it indicates if condition ends here.

#echo "All arguments passed: $@"
#git mysql postfix net-tools
#package = git for first time

for package in $@
do
    yum list installed $package &>> $LOGFILE #check if not installed 
    if [ $? -ne 0 ]
    then 
        yum install $package -y &>> $LOGFILE # install the package
        VALIDATE $? "Installation of $package" # validate
    else
        echo -e "$package is already installed.. $Y SKIPPING $N"
    fi
done
    
