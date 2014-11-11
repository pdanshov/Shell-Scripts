
#!/bin/sh
(
#########################################################################
####
###
##
## 			Peter Danshov 11.10.14
##                         pdanshv@gmail.com
## 			A bash script to check on Clergerie EDI VM
## 			and email a status report to the company
##
##          Logs are in C:\MinGW\msys\1.0\
##
###
####
#########################################################################

set -x

DiskSpace=`df -h C:`;

TodaysDate=`date +%Y%m%d`

{
	sleep 3
	echo "EHLO ehost.com"
	sleep 1.3
	#echo "AUTH LOGIN"
	echo "AUTH PLAIN AHBkYW5zaG92QGNzaS1ueS5jb20AQ3NpODUxOTEy"
	sleep 1.3
	echo "MAIL FROM: pdanshov@csi-ny.com"
	sleep 1.3
	echo "RCPT TO: pdanshov@csi-ny.com"
	sleep 1.3
	echo "RCPT TO: jprunier@csi-ny.com"
	sleep 1.3
	echo "DATA"
	sleep 2
	echo "from:Clergerie_EDI"
	sleep 1.3
	echo "to:CSI"
	sleep 1.3
	echo "cc:pdanshov@csi-ny.com,jprunier@csi-ny.com"
	sleep 1.3
	echo "subject:Clergerie EDI Machine Report"
	sleep 1.3
	echo "MIME-Version: 1.0"
	sleep 1.3
	echo -e "Content-Type: text/html; charset=\"ISO-8859-1\""
	echo "<HTML>"
	echo "<HEAD>"
	echo "<meta http-equiv='content-type' content='text/html; charset=ISO-8859-1'>"
	echo "<style>"
	echo -e "	body {font-family: Calibri, Candara, Segoe, \"Segoe UI\", Optima, Arial, sans-serif;}"
	echo "</style>"
	echo "</HEAD>"
	echo "<BODY>"
	echo "<P/>Clergerie EDI Machine Diskspace:"
	echo "<br/>$DiskSpace"
	echo "<P/>The backup script was run manually. (C:\Users\Administrator\Backup.bat)"
	echo -e "\t\t\t\n\n\n\n"
	echo -e "."
	sleep 1.3
	echo "QUIT"
} | telnet smtp.ehost.com 25

) 2>&1 | tee /PO_Check_Bash.log
