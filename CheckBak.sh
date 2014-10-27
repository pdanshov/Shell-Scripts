#!/bin/sh
set -x
# Add the msys path
PATH=$WD:$PATH

. $WD/../etc/profile
. $HOME/.profile

# Real script stuff follows here ....

cd /x/
cd ./CSI
CSI=`find / -mtime -2 -printf "%T@" -ls | sort`
cd ../MAINETTI
Mainetti=`find / -mtime -2 -printf "%T@" -ls | sort`
cd ../HUIT/SQL_2000
HUIT=`find / -mtime -2 -printf "%T@" -ls | sort`
cd ../../FREELANCE/SQL2008
Freelance=`find / -mtime -2 -printf "%T@" -ls | sort`

# perl -MMIME::Base64 -e 'print encode_base64("pdanshov@csi-ny.com");'
# cGRhbnNob3YtbnkuY29t
# perl -MMIME::Base64 -e 'print encode_base64("Csi851912");'
# Q3NpODUxOTEy
# perl -MMIME::Base64 -e 'print encode_base64("\000pdanshov\@csi-ny.com\000Csi851912");' 
# AHBkYW5zaG92QGNzaS1ueS5jb20AQ3NpODUxOTEy

telnet smtp.ehost.com 25
sleep 0.5
echo "EHLO ehost.com"
sleep 0.5
#echo "AUTH LOGIN"
echo "AUTH PLAIN AHBkYW5zaG92QGNzaS1ueS5jb20AQ3NpODUxOTEy"
sleep 0.5
# AUTH Plain Login - Otherwise, commented out is the base64 encoding
#echo "cGRhbnNob3YtbnkuY29t"
#echo "pdanshov@csi-ny.com"
#sleep 0.5
#echo "Q3NpODUxOTEy"
#echo "Csi851912"
echo "MAIL FROM: pdanshov@csi-ny.com"
sleep 0.5
echo "RCPT TO: pdanshov@csi-ny.com"
sleep 0.5
#echo "RCPT TO: dhubert@csi-ny.com"
sleep 0.5
#echo "RCPT TO: jprunier@csi-ny.com"
sleep 0.5
#echo "RCPT TO: adyer@csi-ny.com"
sleep 0.5
echo "DATA"
sleep 0.5
"From: Daily Auto-Backup Report
To: CSI
Subject: Daily Auto-Backup Report

CSI Backups:

$CSI

Mainetti Backups:

$Mainetti

HUIT Backups:

$HUIT

Freelance Backups:

$Freelance

."
sleep 5
echo "QUIT"


