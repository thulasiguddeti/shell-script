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