#!/bin/bash
ID=$(id -u)
if [ $ID -ne 0 ]
then
    echo "Error :: Please run the script with root acess"
else
    echo "Your are a root user"
fi

yum install mysql -y