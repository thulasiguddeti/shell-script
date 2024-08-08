#!/bin/bash
ID=$(id -u)
if [ $ID -ne 0 ]
then
    echo "Error :: Please run the script with root acess"
    exit 1 # you can give other than zero
else
    echo "Your are a root user"
fi # it indicates if condition ends here.

yum install mysql -y

# validation whether installed or not mysql
if [ $? -ne 0 ]
then
    echo "Error :: Installing MYSQL is failed"
    exit 1
else
    echo "Installing MySql is success"
fi 

yum install nginx -y 

# validation whether installed or not Git

if [ $? -ne 0 ]
then
    echo "Error :: Installing GIT is failed"
    exit 1
else
    echo "Installing GIT is success"
fi 


    