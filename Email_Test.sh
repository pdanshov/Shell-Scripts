
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



#command | cut -c1-8

#var=$(command)
#echo ${var:0:8}


# $((${#str}-1))


CSI=`find . -mtime -1 -printf "%P %kKB\n" | sort`
cd /Auto_Backups/MAINETTI
#Mainetti=`find . -mtime -1 -printf "%P%kKB\n" | cut -c1-8 | sort`
Mainetti=`find . -mtime -1 -printf "%P %kKB\n" | sort`

cd "/Auto_Backups/PRIDES CORNER"
Prides=`find . -mtime -1 -printf "%P %kKB\n" | sort`
cd /Auto_Backups/AAWS
AAWS=`find . -mtime -1 -printf "%P %kKB\n" | sort`
cd /Auto_Backups/Vector
Vector=`find . -mtime -1 -printf "%P %kKB\n" | sort`
cd "/Auto_Backups/31Inc"
Inc31=`find . -mtime -1 -printf "%P %kKB\n" | sort`

cd /Auto_Backups/HUIT/SQL_2000
HUIT=`find . -mtime -1 -printf "%P %kKB\n" | sort`
cd /Auto_Backups/HUIT/SQL_2005
HUIT2=`find . -mtime -1 -printf "%P %kKB\n" | sort`
HUIT="$HUIT\n$HUIT2"

#		This section doesn't work because the "data" folder is huge and 
#		takes a long time to parse
####
####cd /Auto_Backups/HUIT
####HUIT=`find . -mtime -1 -printf "%t\t%kKB\t202.1.1.107$PWD/%P\n" | sort`
####
cd /Auto_Backups/FREELANCE/SQL2008
Freelance=`find . -mtime -1 -printf "%P %kKB\n" | sort`

cd /Auto_Backups/EDI
EDI=`find . -mtime -1 -printf "%P %kKB\n" | sort`
while read -r line
 do
	if [ $(echo "$((${#line}-4))") = " 0KB" ]; then
		#Do Nothing;
	else
		#"$(echo $word | head -c 1)"
		#
		# -or-
		#
		#firstletter=${word:0:1}
		#
		##########################################################################
		# ########################################################################
		# #
		# #
		# #						Multiple "if" conditions in bash
		# #
		# #
		# #
		# #
		# #	if ( [[ $VAK = "NOS" ]] && [[ $TYPE = "LES" ]] && 
		# #		 [[ $ONDERWERP = "BEVEILIGING" ]] && [[ $ACTIE = "UITVOEREN" ]] ); 
		# #
		# #
		# #
		# #	AND:
		# #	[ EXPR1 -a EXPR2 ]
		# #	OR:
		# #	[ EXPR1 -o EXPR2 ]
		# #
		# #	[[ $count -gt 0 && $someVar != $var ]]
		# #
		# #	if [ $count -gt 0 ] && [ $somevar != $var ];
		# #
		# #
		# #
		# #	if [[ a -eq 1 || b -eq 2 ]] || [[ a -eq 3 && b -eq 4 ]]
		# #
		# #	if (( a == 1 || b == 2 )) || (( a == 3 && b == 4 ))
		# #
		# #
		# #
		#
		#if [ "${line:0:3}" = "DEV" ]; then
			EDIx="$EDIx\n$line";
		#fi
	fi
done < "$EDI"

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
CSIu=`find . -mtime -1 -printf "%P %kKB\n" | sort`
cd /usb1-1.1share1/Auto_Backups/MAINETTI
Mainettiu=`find . -mtime -1 -printf "%P %kKB\n" | sort`

cd "/usb1-1.1share1/Auto_Backups/PRIDES CORNER"
Pridesu=`find . -mtime -1 -printf "%P %kKB\n" | sort`
cd /usb1-1.1share1/Auto_Backups/AAWS
AAWSu=`find . -mtime -1 -printf "%P %kKB\n" | sort`
cd /usb1-1.1share1/Auto_Backups/Vector
Vectoru=`find . -mtime -1 -printf "%P %kKB\n" | sort`
cd "/usb1-1.1share1/Auto_Backups/31Inc"
Inc31u=`find . -mtime -1 -printf "%P %kKB\n" | sort`

cd /usb1-1.1share1/Auto_Backups/HUIT/SQL_2000
HUITu=`find . -mtime -1 -printf "%P %kKB\n" | sort`
cd /usb1-1.1share1/Auto_Backups/HUIT/SQL_2005
HUIT2u=`find . -mtime -1 -printf "%P %kKB\n" | sort`
HUITu="$HUITu\n$HUIT2u"
#####
#cd /usb1-1.1share1/Auto_Backups/HUIT
#HUITu=`find . -mtime -1 -printf "%t\t%kKB\t202.1.1.107$PWD/%P\n" | sort`
#####
cd /usb1-1.1share1/Auto_Backups/FREELANCE/SQL2008
Freelanceu=`find . -mtime -1 -printf "%P %kKB\n" | sort`

cd /usb1-1.1share1/Auto_Backups/EDI
EDIu=`find . -mtime -1 -printf "%P %kKB\n" | sort`

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
#echo "AUTH PLAIN AHBkYW5zaG92QGNzaS1ueS5jb20AQ3NpODUxOTEy"
#sleep 0.5
## AUTH Plain Login - Otherwise, commented out is the base64 encoding
##echo "cGRhbnNob3YtbnkuY29t"
##echo "pdanshov@csi-ny.com"
##sleep 0.5
##echo "Q3NpODUxOTEy"
##echo "Csi851912"
#echo "MAIL FROM: pdanshov@csi-ny.com"
#sleep 0.5
#echo "RCPT TO: pdanshov@csi-ny.com"
#sleep 0.5
##echo "RCPT TO: dhubert@csi-ny.com"
#sleep 0.5
##echo "RCPT TO: jprunier@csi-ny.com"
#sleep 0.5
##echo "RCPT TO: adyer@csi-ny.com"
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



#LIST="some string with a substring you want to match"
#SOURCE="substring"
#if echo "$LIST" | grep -q "$SOURCE"; then
#    echo "matched";
#else
#    echo "no match";
#fi



#POFile850=`find . -name '*850-Import*'`



sleep 5

{
	sleep 3
	echo "EHLO ehost.com"
	sleep 0.7
	#echo "AUTH LOGIN"
	echo "AUTH PLAIN AHBkYW5zaG92QGNzaS1ueS5jb20AQ3NpODUxOTEy"
	sleep 0.7
	echo "MAIL FROM: pdanshov@csi-ny.com"
	sleep 0.7
	echo "RCPT TO: pdanshov@csi-ny.com"
	sleep 0.7
	echo "RCPT TO: dhubert@csi-ny.com"
	sleep 0.7
	echo "RCPT TO: jprunier@csi-ny.com"
	sleep 0.7
	echo "RCPT TO: adyer@csi-ny.com"
	sleep 0.7
	echo "DATA"
	sleep 2
	echo "from:CSI"
	sleep 0.7
	echo "to:Computer Solutions"
	sleep 0.7
	echo "cc:pdanshov@csi-ny.com,dhubert@csi-ny.com,jprunier@csi-ny.com,adyer@csi-ny.com"
	sleep 0.7
	echo "subject:Daily Auto-Backup Report"
	sleep 0.7
	echo "MIME-Version: 1.0"
	sleep 0.7
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
	# CSI
	echo "<P/>CSI:"
	echo "<br/>$(date -d '1 days ago' +%Y-%m-%d)"
	echo "<br/>Backups run from CSI Billing VM."
	echo "<br/>Manual backups are made at reception before posts, and automatic are run from a script nightly."
	if [ $(echo "$CSI" | wc -l) -ge 6 ]; then echo -e "<br/><font color=\"green\">CSI NAS Backup Filecount: $(echo "$CSI" | wc -l)</font>"; else echo -e "<br/><font color=\"red\">CSI NAS Backup Filecount: $(echo "$CSI" | wc -l) < 6</font>"; fi
	echo -e "<PRE>$CSI</PRE>"
	if [ $(echo "$CSIu" | wc -l) -ge 6 ]; then echo -e "<br/><font color=\"green\">CSI USB Backup Filecount: $(echo "$CSIu" | wc -l)</font>"; else echo -e "<br/><font color=\"red\">CSI USB Backup Filecount: $(echo "$CSIu" | wc -l) < 6</font>"; fi
	echo -e "<pre>$CSIu</pre>"
	echo -e "\t\t\t\n"
	#Mainetti
	echo -e "<P/>Mainetti:"
	echo "<br/>$(date +%Y-%m-%d)"
	echo "<br/>Backups run from DevServer VM (Dev) and CSI8 VM (Production)."
	if [ $(echo "$Mainetti" | wc -l) -ge 3 ]; then echo -e "<br/><font color=\"green\">Mainetti NAS Backup Filecount: $(echo "$Mainetti" | wc -l)</font>"; else echo -e "<br/><font color=\"red\">Mainetti NAS Backup Filecount: $(echo "$Mainetti" | wc -l) < 3</font>"; fi
	echo -e "<pre>$Mainetti</pre>"
	if [ $(echo "$Mainettiu" | wc -l) -ge 3 ]; then echo -e "<br/><font color=\"green\">Mainetti USB Backup Filecount: $(echo "$Mainettiu" | wc -l)</font>"; else echo -e "<br/><font color=\"red\">Mainetti USB Backup Filecount: $(echo "$Mainettiu" | wc -l) < 3</font>"; fi
	echo -e "<pre>$Mainettiu</pre>"
	echo -e "\t\t\t\n"
	# Prides
	echo -e "<P/>Prides:"
	echo "<br/>$(date -d '1 days ago' +%Y-%m-%d)"
	echo "<br/>Backups run from CSI2 VM (Production)."
	if [ $(echo "$Prides" | wc -l) -ge 2 ]; then echo -e "<br/><font color=\"green\">Prides NAS Backup Filecount: $(echo "$Prides" | wc -l)</font>"; else echo -e "<br/><font color=\"red\">Prides NAS Backup Filecount: $(echo "$Prides" | wc -l) < 2</font>"; fi
	echo -e "<pre>$Prides</pre>"
	if [ $(echo "$Pridesu" | wc -l) -ge 2 ]; then echo -e "<br/><font color=\"green\">Prides USB Backup Filecount: $(echo "$Pridesu" | wc -l)</font>"; else echo -e "<br/><font color=\"red\">Prides USB Backup Filecount: $(echo "$Pridesu" | wc -l) < 2</font>"; fi
	echo -e "<pre>$Pridesu</pre>"
	echo -e "\t\t\t\n"
	# AAWS
	echo -e "<P/>AAWS:"
	echo "<br/>$(date +%Y-%m-%d)"
	echo "<br/>Backups run from DevServer VM (Dev) and CSI2 VM (Production)."
	if [ $(echo "$AAWS" | wc -l) -ge 9 ]; then echo -e "<br/><font color=\"green\">AAWS NAS Backup Filecount: $(echo "$AAWS" | wc -l)</font>"; else echo -e "<br/><font color=\"red\">AAWS NAS Backup Filecount: $(echo "$AAWS" | wc -l) < 9</font>"; fi
	echo -e "<pre>$AAWS</pre>"
	if [ $(echo "$AAWSu" | wc -l) -ge 9 ]; then echo -e "<br/><font color=\"green\">AAWS USB Backup Filecount: $(echo "$AAWSu" | wc -l)</font>"; else echo -e "<br/><font color=\"red\">AAWS USB Backup Filecount: $(echo "$AAWSu" | wc -l) < 9</font>"; fi
	echo -e "<pre>$AAWSu</pre>"
	echo -e "\t\t\t\n"
	# Vector
	echo -e "<P/>Vector:"
	echo "<br/>$(date -d '1 days ago' +%Y-%m-%d)"
	echo "<br/>Backups run from ?"
	if [ $(echo "$Vector" | wc -l) -ge 5 ]; then echo -e "<br/><font color=\"green\">Vector NAS Backup Filecount: $(echo "$Vector" | wc -l)</font>"; else echo -e "<br/><font color=\"red\">Vector NAS Backup Filecount: $(echo "$Vector" | wc -l) < 5</font>"; fi
	echo -e "<pre>$Vector</pre>"
	if [ $(echo "$Vectoru" | wc -l) -ge 5 ]; then echo -e "<br/><font color=\"green\">Vector USB Backup Filecount: $(echo "$Vectoru" | wc -l)</font>"; else echo -e "<br/><font color=\"red\">Vector USB Backup Filecount: $(echo "$Vectoru" | wc -l) < 5</font>"; fi
	echo -e "<pre>$Vectoru</pre>"
	echo -e "\t\t\t\n"
	# 31Inc
	echo -e "<P/>31Inc:"
	echo "<br/>$(date -d '1 days ago' +%Y-%m-%d)"
	echo "<br/>Backups run from CSI8 VM (Production)."
	if [ $(echo "$Inc31" | wc -l) -ge 3 ]; then echo -e "<br/><font color=\"green\">31Inc NAS Backup Filecount: $(echo "$Inc31" | wc -l)</font>"; else echo -e "<br/><font color=\"red\">31Inc NAS Backup Filecount: $(echo "$Inc31" | wc -l) < 3</font>"; fi
	echo -e "<pre>$Inc31</pre>"
	if [ $(echo "$Inc31u" | wc -l) -ge 3 ]; then echo -e "<br/><font color=\"green\">31Inc USB Backup Filecount: $(echo "$Inc31u" | wc -l)</font>"; else echo -e "<br/><font color=\"red\">31Inc USB Backup Filecount: $(echo "$Inc31u" | wc -l) < 3</font>"; fi
	echo -e "<pre>$Inc31u</pre>"
	echo -e "\t\t\t\n"
	# HUIT
	echo -e "<P/>HUIT:"
	echo "<br/>$(date -d '1 days ago' +%Y-%m-%d)"
	echo "<br/>Backups run from HUIT EDI VM."
	# this is 5 instead of 6 because the combination of the two variables for some 
	# reason does not count the \n (newline - carriage return) character
	if [ $(echo "$HUIT" | wc -l) -ge 5 ]; then echo -e "<br/><font color=\"green\">HUIT NAS Backup Filecount: $(echo "$HUIT" | wc -l)</font>"; else echo -e "<br/><font color=\"red\">HUIT NAS Backup Filecount: $(echo "$HUIT" | wc -l) < 5</font>"; fi
	echo -e "<pre>$HUIT</pre>"
	if [ $(echo "$HUITu" | wc -l) -ge 5 ]; then echo -e "<br/><font color=\"green\">HUIT USB Backup Filecount: $(echo "$HUITu" | wc -l)</font>"; else echo -e "<br/><font color=\"red\">HUIT USB Backup Filecount: $(echo "$HUITu" | wc -l) < 5</font>"; fi
	echo -e "<pre>$HUITu</pre>"
	echo -e "\t\t\t\n"
	# EDI
	echo -e "<P/>EDI:"
	echo "<br/>$(date -d '1 days ago' +%Y-%m-%d)"
	if [ $(echo "$EDIx" | wc -l) -ge 5 ]; then echo -e "<br/><font color=\"green\">EDI NAS Backup Filecount: $(echo "$EDIx" | wc -l)</font>"; else echo -e "<br/><font color=\"red\">EDI NAS Backup Filecount: $(echo "$EDIx" | wc -l) < 5</font>"; fi
	echo -e "<pre>$EDIx</pre>"
	if [ $(echo "$EDIu" | wc -l) -ge 5 ]; then echo -e "<br/><font color=\"green\">EDI USB Backup Filecount: $(echo "$EDIu" | wc -l)</font>"; else echo -e "<br/><font color=\"red\">EDI USB Backup Filecount: $(echo "$EDIu" | wc -l) < 5</font>"; fi
	echo -e "<pre>$EDIu</pre>"
	echo -e "\t\t\t\n"
	# Freelance
	echo -e "<P/>Freelance:"
	echo "<br/>$(date +%Y-%m-%d)"
	echo "<br/>Backups run from Freelance EDI VM."
	if [ $(echo "$Freelance" | wc -l) -ge 3 ]; then echo -e "<br/><font color=\"green\">Freelance NAS Backup Filecount: $(echo "$Freelance" | wc -l)</font>"; else echo -e "<br/><font color=\"red\">Freelance NAS Backup Filecount: $(echo "$Freelance" | wc -l) < 3</font>"; fi
	echo -e "<pre>$Freelance</pre>"
	if [ $(echo "$Freelanceu" | wc -l) -ge 3 ]; then echo -e "<br/><font color=\"green\">Freelance USB Backup Filecount: $(echo "$Freelanceu" | wc -l)</font>"; else echo -e "<br/><font color=\"red\">Freelance USB Backup Filecount: $(echo "$Freelanceu" | wc -l) < 3</font>"; fi
	echo -e "<pre>$Freelanceu</pre>"
	echo -e "\t\t\t\n\n\n\n"
	echo -e "."
	sleep 0.5
	echo "QUIT"
} | telnet smtp.ehost.com 25

) 2>&1 | tee /Email_Test_Bash.log
