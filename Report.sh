
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

count=0

while read line
 do
  let count=count+1
  bak="$bak$line
";
done < C:/MinGW/msys/1.0/Manual_Bak.txt

rm C:/MinGW/msys/1.0/Manual_Bak.txt


while read line
 do
  let count=count+1
  last="$last$line
";
done < C:\MinGW\msys\1.0\Last_Backup.txt

{
	sleep 2
	echo "EHLO ehost.com"
	sleep 1.0
	#echo "AUTH LOGIN"
	echo "AUTH PLAIN AHBkYW5zaG9AQ3NpODUxOTEy"
	sleep 1.3
	echo "MAIL FROM: pdany.com"
	sleep 1.3
	echo "RCPT TO: pdany.com"
	sleep 1.3
	echo "RCPT TO: jpruny.com"
	sleep 1.3
	echo "RCPT TO: dhub-ny.com"
	sleep 1.3
	echo "DATA"
	sleep 2
	echo "from:Clergerie_EDI"
	sleep 1.3
	echo "to:CSI"
	sleep 1.3
	echo "cc:pdanny.com"
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
	echo "<PRE>$DiskSpace</PRE>"
	echo "<P/>Manual backup (C:\Users\Administrator\Desktop\Backup.bat) triggered:"
	echo "<br>$count times."
	echo "<pre>$bak</pre>"
	echo "<p>Last backup ran on: $last"
	echo -e "\t\t\t\n\n\n\n"
	echo -e "."
	sleep 1.3
	echo "QUIT"
} | telnet smtp.ehost.com 25

) 2>&1 | tee /PO_Check_Bash.log
