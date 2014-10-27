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
# cGRhbnN3YtbnkuY29t
# perl -MMIME::Base64 -e 'print encode_base64("Csi12");'
# Q3NpOTEy
# perl -MMIME::Base64 -e 'print encode_base64("\000pdv\@csom\000Cs912");' 
# AHBkYW5zaG92QGN3NpODUxOTEy

telnet smtp.ehost.com 25
sleep 0.5
echo "EHLO ehost.com"
sleep 0.5
#echo "AUTH LOGIN"
echo "AUTH PLAIN AHBkYW5zaG92QGNzaS0AQ3NpODUxOTEy"
sleep 0.5
# AUTH Plain Login - Otherwise, commented out is the base64 encoding
#echo "cGRhbnNnkuY29t"
#echo "pdanssi-ny.com"
#sleep 0.5
#echo "Q3NpUxOTEy"
#echo "Csi1912"
echo "MAIL FROM: pdansy.com"
sleep 0.5
echo "RCPT TO: pdanshny.com"
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


