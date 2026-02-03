#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ];then
    echo "please run this script with root user access"
    exit 1
 fi   

 echo "installing Nginx"
 dnf install nginx -y

 if [ $? -ne 0 ]; then
     echo "installing Nginx ... FAILURE"
     exit 1
  else
      echo "installing Nginx ... SUCCESS"
 fi  

 dnf install mysql -y

 if [ $? -ne 0 ]; then
     echo "installing mysql ... FAILURE"
     exit 1
  else
      echo "installing mysql ... SUCCESS"
 fi  

 dnf install nodejs -y

 if [ $? -ne 0 ]; then
     echo "installing nodejs ... FAILURE"
     exit 1
  else
      echo "installing nodejs ... SUCCESS"
 fi  
