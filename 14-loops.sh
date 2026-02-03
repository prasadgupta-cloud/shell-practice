#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOG_FILE="/var/log/shell-script/$0.log"

if [ $USERID -ne 0 ];then
    echo "please run this script with root user access"
    exit 1
 fi   

mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "$2 ... FAILURE"
        exit 1
    else
        echo "$2 ... SUCCESS"
    fi
}
 
for package in $@ # sudo sh 14-loops.sh nginx mysql nodejs
do
     dnf install $package -y &>>$LOGS_FILE
     VALIDATE $? "$package installation"
done    