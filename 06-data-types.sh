#!/bin/bash

Num1=$1
Num2=$2

sum=$((Num1+Num2)) 
echo "Total is : $sum"
echo "How many args passed:: $#"
echo "All args passed:: $@"
echo "Script Name:: $0"