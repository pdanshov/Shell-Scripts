
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

NAS_DiskSpace=`df -h X:`;

ArrayComp=(CSI Mainetti Prides AAWS Vector _31Inc Freelance HUIT)
ArrayExp=(6 3 3 3 3 3 3 5)
ArrayDirs=("CSI" "MAINETTI" "PRIDES CORNER" "AAWS" "Vector" "31Inc" "FREELANCE/SQL2008" "HUIT/SQL_2000")

umount /Auto_Backups
umount /usb1-1.1share1

mount X: /Auto_Backups
mount U: /usb1-1.1share1

for ((i=0; i<${#ArrayComp[@]}; i++)); do
	xx=${ArrayComp[i]}
	cd /Auto_Backups/${ArrayDirs[i]}
	n$xx=`find . -mtime -1 -printf "<br/>%t\t%kKB\t202.1.1.107$PWD/%P\n" | sort`
	cd /usb1-1.1share1/Auto_Backups/${ArrayDirs[i]}
	u${ArrayComp[i]}=`find . -mtime -1 -printf "<br/>%t\t%kKB\t202.1.1.107$PWD/%P\n" | sort`
done

cd /Auto_Backups/HUIT/SQL_2005
HUIT2=`find . -mtime -1 -printf "<br/>%t\t%kKB\t202.1.1.107$PWD/%P\n" | sort`
nHUIT="$HUITn\n$HUIT2"
cd /usb1-1.1share1/Auto_Backups/HUIT/SQL_2005
HUIT2u=`find . -mtime -1 -printf "<br/>%t\t%kKB\t202.1.1.107$PWD/%P\n" | sort`
uHUIT="$HUITu\n$HUIT2u"

umount /Auto_Backups
umount /usb1-1.1share1

sleep 5

{
	sleep 0.5
	echo "EHLO ehost.com"
	sleep 0.5
	#echo "AUTH LOGIN"
	echo "AUTH PLAIN AHBkYW5zaG92QGNzaS1ueS5jb20AQ3NpODUxOTEy"
	sleep 0.5
	echo "MAIL FROM: pdanshov@csi-ny.com"
	sleep 0.5
	echo "RCPT TO: pdanshov@csi-ny.com"
	sleep 0.5
	#echo "RCPT TO: dhubert@csi-ny.com"
	#sleep 0.5
	#echo "RCPT TO: jprunier@csi-ny.com"
	#sleep 0.5
	#cho "RCPT TO: adyer@csi-ny.com"
	sleep 0.5
	echo "DATA"
	sleep 2
	echo "from:CSI"
	sleep 0.5
	echo "to:Computer Solutions"
	sleep 0.5
	#echo "cc:pdanshov@csi-ny.com,dhubert@csi-ny.com,jprunier@csi-ny.com,adyer@csi-ny.com"
	#sleep 0.5
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
	
	for ((i=0; i<${#ArrayComp[@]}; i++)); do
		# NAS
		xx=${ArrayComp[i]}
		newvar=${!n$xx}
		echo "<P/>${ArrayComp[i]} NAS Backups: (Date should be $(date -d '1 days ago' +%Y-%m-%d))"
		if [ $(echo "$newvar" | wc -l) = "${ArrayExp[i]}" ]; then echo -e "<br/><font color=\"green\">${ArrayComp[i]} NAS Backup Filecounts Match: $(echo "$newvar" | wc -l) = ${ArrayExp[i]}</font>"; else echo -e "<br/><font color=\"red\">${ArrayComp[i]} NAS Backup Filecount Mismatch: $(echo "$newvar" | wc -l) =/= ${ArrayExp[i]}</font>"; fi
		echo -e "<PRE>$newvar</PRE>"
		echo -e "\t\t\t\n"
	done
	
	echo    "<P/>"
	echo    "                  ===================================================<BR/>"
	echo    "                  ===================================================<BR/>"
	echo    "<BR/>"
	
	for ((i=0; i<${#ArrayComp[@]}; i++)); do
		# USB
		echo "<P/>${ArrayComp[i]} USB Backups: (Date should be $(date -d '1 days ago' +%Y-%m-%d))"
		if [ $(echo "${ArrayComp[i]}u" | wc -l) = "${ArrayExp[i]}" ]; then echo -e "<br/><font color=\"green\">${ArrayComp[i]} USB Backup Filecounts Match: $(echo "${ArrayComp[i]}u" | wc -l) = ${ArrayExp[i]}</font>"; else echo -e "<br/><font color=\"red\">${ArrayComp[i]} USB Backup Filecount Mismatch: $(echo "${ArrayComp[i]}u" | wc -l) =/= ${ArrayExp[i]}</font>"; fi
		echo -e "<pre>${ArrayComp[i]}u</pre>"
		echo -e "\t\t\t\n"
	done
	
	echo -e "."
	sleep 0.5
	echo "QUIT"
} | telnet smtp.ehost.com 25

) 2>&1 | tee /Emailx_Test_Bash.Log
