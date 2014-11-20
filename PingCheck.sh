#!/bin/bash
(
#########################################################################
####
###
##
## 						 Peter Danshov 10.22.14
##                         pdanshv@gmail.com
## 			A bash script to check status of servers and add to email
##			Usage: ./PingCheck.sh google.com 192.168.1.1 \csi2 mybox N2100
##			Modfied, original: 
##			http://linuxconfig.org/bash-scripts-to-scan-and-monitor-network
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


###################### Original (up to 11.19.14):
## for i in $@
# do
# ping -r 1 $i &> /dev/null
# if [ $? -ne 0 ]; then
	# echo "`date`: ping failed, $i is <font color=\"red\">offline</font>.<br/>"
# elif [ $? -eq 1 ]; then
	# echo "`date`: ping return, $i is <font color=\"green\">online</font>.<br/>"
# else
	# echo "."
# fi
# done
#################################################

## ping -r 1 -n 3 192.168.1.5; echo $? - $? variable stores the return code of
## 											the last command completed command

### ping 202.1.1.182 -n 1 | grep unreachable | awk '{print $1}'
###
###		Reply

set -x

for i in $@
do
ping -r 1 $i &> /dev/null;
retcode="$?";
s=`ping $i -r 1 -n 2 | grep unreachable | head -n1 | awk '{print $1}'`;

if [ "$s" != "Reply" ]; then
	if [ "$retcode" = "1" ]; then
		echo "`date`: ping failed, $i is <font color=\"red\">offline</font>.<br/>";
	elif [ "$retcode" = "0" ]; then
		echo "`date`: ping return, $i is <font color=\"green\">online</font>.<br/>";
	else
		echo ". $s $?";
	fi
else
	echo "`date`: ping failed, $i is <font color=\"red\">offline</font>.<br/>";
fi
done


) 2>&1 | tee /PingCheck_Bash.log





