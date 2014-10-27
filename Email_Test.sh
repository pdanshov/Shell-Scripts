
#!/bin/sh
(
#########################################################################
####
###
##
## 						 Peter Danshov 09.23.14
##                         pdanshv@gmail.com
## 			A bash script to check for backups within the last 24 hours
## 			and email a status report to the company
##
###         Logs are in C:\MinGW\msys\1.0\
####
#########################################################################

set -x
echo "`pwd`"
# Add the msys path
### PATH=$WD:$PATH

#NAS_DiskSpace=`df -h /g/ L: S:`;
NAS_DiskSpace=`df -h X:`;

#echo "$NAS_DiskSpace" | tr '\n' '<br/>'

### . $WD/../etc/profile
### . $HOME/.profile

# Real script stuff follows here ....

#cd /x/
#cd X:/
#cd /X/
#cd /x:/
#cd X:
#cd x:
#cd /x/
#cd /X:/
#cd x:/
#:<<'bomb'
umount /Auto_Backups
umount /usb1-1.1share1

mount X: /Auto_Backups
mount U: /usb1-1.1share1
cd /Auto_Backups/CSI
#CSI=`find . -mtime -2 -printf "%T@" -ls | sort`
#Freelance=`find . -mtime -2 -printf "%a\n" -ls | sort`
#find "$PWD" -type f -name '*.txt' -printf "%k %h/%f\n" | sort -rg
###
### Adds a leaading number, numbering each record
###
### CSI=`find . -mtime -1 -printf "%t\t%kKB\t202.1.1.107$PWD/%P\n" | sort | nl -nrz -w2`
###
CSI=`find . -mtime -1 -printf "<br/>%t\t%kKB\t202.1.1.107$PWD/%P\n" | sort`
cd /Auto_Backups/MAINETTI
Mainetti=`find . -mtime -1 -printf "<br/>%t\t%kKB\t202.1.1.107$PWD/%P\n" | sort`
cd /Auto_Backups/HUIT/SQL_2000
HUIT=`find . -mtime -1 -printf "<br/>%t\t%kKB\t202.1.1.107$PWD/%P\n" | sort`
cd /Auto_Backups/HUIT/SQL_2005
HUIT2=`find . -mtime -1 -printf "<br/>%t\t%kKB\t202.1.1.107$PWD/%P\n" | sort`
HUIT="$HUIT\n$HUIT2"

#		This section doesn't work because the "data" folder is huge and 
#		takes a long time to parse
####
####cd /Auto_Backups/HUIT
####HUIT=`find . -mtime -1 -printf "%t\t%kKB\t202.1.1.107$PWD/%P\n" | sort`
####
cd /Auto_Backups/FREELANCE/SQL2008
Freelance=`find . -mtime -1 -printf "<br/>%t\t%kKB\t202.1.1.107$PWD/%P\n" | sort`
# for i in $( find . -mtime -1 ); do printf "%t\t%kKB\t202.1.1.107$PWD/%P\n" "$i"; done
# awk '{printf("%010d %s\n", NR, $0)}'
# awk '{printf("%02d %t\t%kKB\t202.1.1.107$PWD/%P\n", NR, $0)}'
# nl -nrz -w2 /etc/passwd
# find . -mtime -1 -printf "%t\t%kKB\t202.1.1.107$PWD/%P\n" | sort | xargs wc -l
########################################
## !/bin/bash
## counter=0
## filename=$1
## while read -r line
## do
##   printf "%010d %s" $counter $line
##   let counter=$counter+1
## done < "$filename"
########################################
cd /usb1-1.1share1/Auto_Backups/CSI
CSIu=`find . -mtime -1 -printf "<br/>%t\t%kKB\t202.1.1.107$PWD/%P\n" | sort`
cd /usb1-1.1share1/Auto_Backups/MAINETTI
Mainettiu=`find . -mtime -1 -printf "<br/>%t\t%kKB\t202.1.1.107$PWD/%P\n" | sort`
cd /usb1-1.1share1/Auto_Backups/HUIT/SQL_2000
HUITu=`find . -mtime -1 -printf "<br/>%t\t%kKB\t202.1.1.107$PWD/%P\n" | sort`
cd /usb1-1.1share1/Auto_Backups/HUIT/SQL_2005
HUIT2u=`find . -mtime -1 -printf "<br/>%t\t%kKB\t202.1.1.107$PWD/%P\n" | sort`
HUITu="$HUITu\n$HUIT2u"
#####
#cd /usb1-1.1share1/Auto_Backups/HUIT
#HUITu=`find . -mtime -1 -printf "%t\t%kKB\t202.1.1.107$PWD/%P\n" | sort`
#####
cd /usb1-1.1share1/Auto_Backups/FREELANCE/SQL2008
Freelanceu=`find . -mtime -1 -printf "<br/>%t\t%kKB\t202.1.1.107$PWD/%P\n" | sort`

umount /Auto_Backups
umount /usb1-1.1share1

#You use netcat for this, not telnet.
#Code:
#[xxx@xxx src]$ nc localhost 25 << EOF
#> HELO localhost
#> MAIL FROM: user@whatever.com
#> RCPT TO: user@whatever.com
#> DATA
#> this is a test
#> .
#> QUIT
#bomb
#telnet smtp.ehost.com 25
#sleep 0.5
#echo "EHLO ehost.com"
#sleep 0.5
##echo "AUTH LOGIN"
#echo "AUTH PLAIN AHBkYW5zaG92QGNzajb20AQ3NpODUxOTEy"
#sleep 0.5
## AUTH Plain Login - Otherwise, commented out is the base64 encoding
##echo "cGRhbnNob3YtbnkuY29t"
##echo "pdam"
##sleep 0.5
##echo "Q3NpODUxOTEy"
##echo "Csi851912"
#sleep 0.5
#echo "DATA"
#sleep 0.5
#echo "From: Daily Auto-Backup Report\n
#To: CSI\n
#Subject: Daily Auto-Backup Report\n
#\n\n
#CSI Backups:\n
#\n
#$CSI
#\t\t\t\n
#Mainetti Backups:\n
#\n
#$Mainetti
#\t\t\t\n
#HUIT Backups:\n
#\n
#$HUIT
#\t\t\t\n
#Freelance Backups:\n
#\n
#$Freelance
#\t\t\t\n\n\n\n
#."
#sleep 5
#echo "QUIT"

sleep 5

{
	sleep 0.5
	echo "EHLO ehost.com"
	sleep 0.5
	#echo "AUTH LOGIN"
	echo "AUTH PLAIN AHBkYW5AQ3NpODUxOTEy"
	sleep 0.5
	echo "MAIL FROM: pdansm"
	sleep 0.5
	echo "RCPT TO: pdam"
	sleep 0.5
	echo "DATA"
	sleep 2
	echo "from:CSI"
	sleep 0.5
	echo "to:Computer Solutions"
	sleep 0.5
	echo "cc:pdanshy.com"
	sleep 0.5
	echo "subject:Daily Auto-Backup Report"
	sleep 0.5
	echo "MIME-Version: 1.0"
	sleep 0.5
	echo -e "Content-Type: text/html; charset=\"ISO-8859-1\""
	echo "<HTML>"
	echo "<HEAD>"
	echo "<meta http-equiv='content-type' content='text/html; charset=ISO-8859-1'>"
	echo "<style>"
	echo -e "	body {font-family: Calibri, Candara, Segoe, \"Segoe UI\", Optima, Arial, sans-serif;}"
	echo "</style>"
	echo "</HEAD>"
	echo "<BODY>"
	echo "<P/><u>CSI NAS Diskspace Report:</u>"
	echo "<PRE>$NAS_DiskSpace</PRE>"
	echo "<P/><U>VM Status:</U><br/>"
	echo "CSI2 VM: "
	/home/Administrator/Scripts/PingCheck.sh 202.1.1.112
	echo "CSI5 VM: "
	/home/Administrator/Scripts/PingCheck.sh 202.1.1.15
	echo "CSI8 VM: "
	/home/Administrator/Scripts/PingCheck.sh 202.1.1.121
	echo "CSI12 VM: "
	/home/Administrator/Scripts/PingCheck.sh 202.1.1.12
	echo "DevServer VM: "
	/home/Administrator/Scripts/PingCheck.sh 202.1.1.20
	echo "CSI Billing VM: "
	/home/Administrator/Scripts/PingCheck.sh 202.1.1.116
	echo "HUIT EDI VM: "
	/home/Administrator/Scripts/PingCheck.sh 202.1.1.60
	echo "Freelance EDI VM: "
	/home/Administrator/Scripts/PingCheck.sh 202.1.1.182
	echo "<P/><u>The following are the latest backups for the designated companies:</u>"
	echo "<P/>CSI NAS Backups: (Date should be $(date -d '1 days ago' +%Y-%m-%d))"
	echo "<br/>Backups run from CSI Billing VM."
	# this was 10 at some point - morning manual backup
	if [ $(echo "$CSI" | wc -l) = "6" ]; then echo -e "<br/><font color=\"green\">CSI NAS Backup Filecounts Match: $(echo "$CSI" | wc -l) = 6</font>"; else echo -e "<br/><font color=\"red\">CSI NAS Backup Filecount Mismatch: $(echo "$CSI" | wc -l) =/= 6</font>"; fi
	echo -e "<PRE>$CSI</PRE>"
	echo -e "\t\t\t\n"
	echo -e "<P/>Mainetti NAS Backups: (Date should be $(date +%Y-%m-%d))"
	echo "<br/>Backups run from DevServer VM (Dev) and CSI8 VM (Production)."
	if [ $(echo "$Mainetti" | wc -l) = "28" ]; then echo -e "<br/><font color=\"green\">Mainetti NAS Backup Filecounts Match: $(echo "$Mainetti" | wc -l) = 28</font>"; else echo -e "<br/><font color=\"red\">Mainetti NAS Backup Filecount Mismatch: $(echo "$Mainetti" | wc -l) =/= 28</font>"; fi
	echo -e "<pre>$Mainetti</pre>"
	echo -e "\t\t\t\n"
	echo -e "<P/>HUIT NAS Backups: (Date should be $(date -d '1 days ago' +%Y-%m-%d))"
	echo "<br/>Backups run from HUIT EDI VM."
	# this is 5 instead of 6 because the combination of the two variables for some 
	# reason does not count the \n (newline - carriage return) character
	if [ $(echo "$HUIT" | wc -l) = "5" ]; then echo -e "<br/><font color=\"green\">HUIT NAS Backup Filecounts Match: $(echo "$HUIT" | wc -l) = 5</font>"; else echo -e "<br/><font color=\"red\">HUIT NAS Backup Filecount Mismatch: $(echo "$HUIT" | wc -l) =/= 5</font>"; fi
	echo -e "<pre>$HUIT</pre>"
	echo -e "\t\t\t\n"
	echo -e "<P/>Freelance NAS Backups: (Date should be $(date +%Y-%m-%d))"
	echo "<br/>Backups run from Freelance EDI VM."
	if [ $(echo "$Freelance" | wc -l) = "3" ]; then echo -e "<br/><font color=\"green\">Freelance NAS Backup Filecounts Match: $(echo "$Freelance" | wc -l) = 3</font>"; else echo -e "<br/><font color=\"red\">Freelance NAS Backup Filecount Mismatch: $(echo "$Freelance" | wc -l) =/= 3</font>"; fi
	echo -e "<pre>$Freelance</pre>"
	echo    "<P/>"
	echo    "                  ===================================================<BR/>"
	echo    "                  ===================================================<BR/>"
	echo    "<BR/>"
	echo "CSI USB Backups: (Date should be $(date -d '1 days ago' +%Y-%m-%d))"
	if [ $(echo "$CSIu" | wc -l) = "6" ]; then echo -e "<br/><font color=\"green\">CSI USB Backup Filecounts Match: $(echo "$CSIu" | wc -l) = 6</font>"; else echo -e "<br/><font color=\"red\">CSI USB Backup Filecount Mismatch: $(echo "$CSIu" | wc -l) =/= 6</font>"; fi
	echo -e "<pre>$CSIu</pre>"
	echo -e "\t\t\t\n"
	echo -e "<p/>Mainetti USB Backups: (Date should be $(date +%Y-%m-%d))"
	if [ $(echo "$Mainettiu" | wc -l) = "28" ]; then echo -e "<br/><font color=\"green\">Mainetti USB Backup Filecounts Match: $(echo "$Mainettiu" | wc -l) = 28</font>"; else echo -e "<br/><font color=\"red\">Mainetti USB Backup Filecount Mismatch: $(echo "$Mainettiu" | wc -l) =/= 28</font>"; fi
	echo -e "<pre>$Mainettiu</pre>"
	echo -e "\t\t\t\n"
	echo -e "<p/>HUIT USB Backups: (Date should be $(date -d '1 days ago' +%Y-%m-%d))"
	if [ $(echo "$HUITu" | wc -l) = "5" ]; then echo -e "<br/><font color=\"green\">HUIT USB Backup Filecounts Match: $(echo "$HUITu" | wc -l) = 5</font>"; else echo -e "<br/><font color=\"red\">HUIT USB Backup Filecount Mismatch: $(echo "$HUITu" | wc -l) =/= 5</font>"; fi
	echo -e "<pre>$HUITu</pre>"
	echo -e "\t\t\t\n"
	echo -e "<p/>Freelance USB Backups: (Date should be $(date +%Y-%m-%d))"
	if [ $(echo "$Freelanceu" | wc -l) = "3" ]; then echo -e "<br/><font color=\"green\">Freelance USB Backup Filecounts Match: $(echo "$Freelanceu" | wc -l) = 3</font>"; else echo -e "<br/><font color=\"red\">Freelance USB Backup Filecount Mismatch: $(echo "$Freelanceu" | wc -l) =/= 3</font>"; fi
	echo -e "<pre>$Freelanceu</pre>"
	echo -e "\t\t\t\n\n\n\n"
	echo -e "."
	sleep 0.5
	echo "QUIT"
} | telnet smtp.ehost.com 25

) 2>&1 | tee /Email_Test_Bash.log
