#!/bin/sh
#(
#########################################################################
####
###
##
## 						 Peter Danshov 09.23.14
##                         pdanshv@gmail.com
## 			A bash script to test parts of code
##
###         Logs are in C:\MinGW\msys\1.0\
####
#########################################################################

set -x

#NAS_DiskSpace=`df -h g: l: s:`;

#) 2>&1 | tee /Email_Test_Bash.log

echo "Hello World"

echo $1
echo $0
echo $@
pause
