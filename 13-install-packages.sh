#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ $ID -ne 0 ]
then
    echo -e "$R Error :: Please run the script with root acess $N"
    exit 1 # you can give other than zero
else
    echo "Your are a root user"
fi # it indicates if condition ends here.

echo "All arguments passed: $@"