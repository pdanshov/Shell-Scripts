#!/bin/bash

#########################################################################
####
###
##
## 						 Peter Danshov 10.22.14
##                         pdanshv@gmail.com
## 			A bash script to check status of servers and add to email
##			Usage: ./PingCheck.sh google.com 192.168.1.1 \csi2 mybox N2100
##			Modfied, original: http://linuxconfig.org/bash-scripts-to-scan-and-monitor-network
###
####
#########################################################################

#for i in $@
#do
#ping -c 1 $i &> /dev/null
#
#if [ $? -ne 0 ]; then
#	echo "`date`: ping failed, $i host is down!" | mail -s "$i host is down!" my@email.address 
#fi
#done

for i in $@
do
ping -r 1 $i &> /dev/null

if [ $? -ne 0 ]; then
	echo "`date`: ping failed, $i is <font color=\"red\">offline</font>.<br/>"
elif [ $? -eq 1 ]; then
	echo "`date`: ping return, $i is <font color=\"green\">online</font>.<br/>"
else
	echo "."
fi
done
