
#!/bin/sh
(
#########################################################################
####
###
##
## 			Peter Danshov 10.14.14
##                      pdanshv@gmail.com
## 			A bash script to check for PO's on HUIT's EDI VM
## 			and email a status report to the company
##
##          Logs are in C:\MinGW\msys\1.0\
##
###
####
#########################################################################



#You can use bash's declare directive and indirection feature like this:
#
#p_val="foo"
#active_id=$p_val
#declare "flag_$active_id"="100"
#
#TESTING:
#> set | grep flag
#flag_foo=100
#
#UPDATE:
#
#p_val="foo"
#active_id="$p_val"
#v="flag_$active_id"
#declare "$v"="100"
#
#> echo "$v"
#flag_foo
#> echo "${!v}"
#100
#
#Usage in if condition:
#
#if [ "${!v}" -ne 100 ]; then
#   echo "yes"
#else
#   echo "no"
#fi
#
# prints no

set -x

TodaysDate=`date +%Y%m%d`
CommID1="";
PO1="";
PODate1="";
Counter=1;
PrintCount=1;

cd C:
cd edicomm/ARCHIVE/"$TodaysDate" #YYYYMMDD
POFile850=`find . -name '*850-Import*'`

if [ ! -z "$POFile850" ]; #check if var is not empty
then
	while read line;
	do
		#echo -e "$line\n";
		Array=( $line );
		y="CommID$Counter";
		if [ "${Array[0]}" == "CTRL" ];
		then
			if [ "${!y}" == "${Array[3]}" ];
			then
				#DO Nothing
				x="PO$Counter";
				declare "PO$Counter"="${!x} <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${Array[2]}";
			elif [ "${!y}" == "" ];
			then
				declare "PO$Counter"="${Array[2]}";
				declare "CommID$Counter"="${Array[3]}";
			else
				Counter=$(( $Counter + 1 ));
				declare "CommID$Counter"="${Array[3]}";
				declare "PO$Counter"="${Array[2]}";
			fi
		elif [ "${Array[0]}" == "HDR1" ];
		then
			currdate="${Array[3]}";
			dateformat="${currdate:4:2}/${currdate:6:2}/${currdate:0:4}"
			declare "PODate$Counter"="$dateformat";
			x="PO$Counter";
			y="PODate$Counter";
			declare "PO$Counter"="${!x} PO Date ${!y}";
		else
			#DO Nothing
			echo "";
		fi
	done < "$POFile850"


echo "PO$Counter ${!x}"
echo "CommID$Counter"
CounterUp=$(( $Counter + 1 ));

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

while [ $PrintCount -lt $CounterUp ];
do
	x="CommID$PrintCount";
	case "${!x}" in
		"120322867")
			declare "CommID$PrintCount"="Bare Co."
			;;
		"CLCARQUEST")
			declare "CommID$PrintCount"="Carquest"
			;;
		"6112391050")
			declare "CommID$PrintCount"="Dillards"
			;;
		"TESTDILLARDS")
			declare "CommID$PrintCount"="Dillards" #Test
			;;
		"8005586779")
			declare "CommID$PrintCount"="Her Room"
			;;
		"6125310421")
			declare "CommID$PrintCount"="Neiman Marcus"
			;;
		"006989867")
			declare "CommID$PrintCount"="Saks" #PO
			;;
		"4142785783")
			declare "CommID$PrintCount"="Saks" #Invoice
			;;
		"6092785376")
			declare "CommID$PrintCount"="Saks" #ASN
			;;
		"6111492199")
			declare "CommID$PrintCount"="Lord & Taylor"
			;;
		"6113310010")
			declare "CommID$PrintCount"="Macy's West"
			;;
		"6113310210")
			declare "CommID$PrintCount"="Macy's West" #Hotbox
			;;
		"6113310020")
			declare "CommID$PrintCount"="Macy's Florida"
			;;
		"6113310220")
			declare "CommID$PrintCount"="Macy's Florida" #Hotbox
			;;
		"6113310047")
			declare "CommID$PrintCount"="Macy's Home"
			;;
		"6113310247")
			declare "CommID$PrintCount"="Macy's Home" #Hotbox
			;;
		"6113310063")
			declare "CommID$PrintCount"="Macy's Midwest"
			;;
		"6113310263")
			declare "CommID$PrintCount"="Macy's Midwest" #Hotbox
			;;
		"6113310064")
			declare "CommID$PrintCount"="Macy's North"
			;;
		"6113310264")
			declare "CommID$PrintCount"="Macy's North" #Hotbox
			;;
		"6113310072")
			declare "CommID$PrintCount"="Bloomingdales"
			;;
		"6113310272")
			declare "CommID$PrintCount"="Bloomingdales" #Hotbox
			;;
		"6113310079")
			declare "CommID$PrintCount"="Bloomingdales" #COM
			;;
		"6313310079BAD")
			declare "CommID$PrintCount"="Bloomingdales" #COM_BAD
			;;
		"6111350016")
			declare "CommID$PrintCount"="JCPenney"
			;;
		"007942915")
			declare "CommID$PrintCount"="Nordstrom"
			;;
		"2062336664")
			declare "CommID$PrintCount"="Nordstrom" #ASN
			;;
		"196877906")
			declare "CommID$PrintCount"="Ashley Diversified"
			;;
		"ZAPPOSKY")
			declare "CommID$PrintCount"="Zappos"
			;;
		*)
			#Do Nothing
			;;
	esac
	PrintCount=$(( $PrintCount + 1 ));
done

echo "PO$Counter ${!x}"
echo "CommID$Counter"
PrintCount=1;

{
	sleep 3
	echo "EHLO ehost.com"
	sleep 1.3
	#echo "AUTH LOGIN"
	echo "AUTH PLAIN AHBkYW5zaG92QGNzaS1upODUxOTEy"
	sleep 1.3
	echo "MAIL FROM: pdanshi-ny.com"
	sleep 1.3
	echo "RCPT TO: pdanshny.com"
	sleep 1.3
	echo "RCPT TO: dhubi-ny.com"
	sleep 1.3
	echo "RCPT TO: jprunsi-ny.com"
	sleep 1.3
	echo "RCPT TO: adyey.com"
	sleep 1.3
	echo "RCPT TO: g.gombt.fr"
	sleep 1.3
	echo "RCPT TO: q.equiuit.fr"
	sleep 1.3
	echo "DATA"
	sleep 2
	echo "from:CSI-HuitVM"
	sleep 1.3
	echo "to:HUIT"
	sleep 1.3
	echo "cc:pdanshoit.fr"
	sleep 1.3
	echo "subject:Automated PO Emails Confirmation"
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
	echo "<P/>Hello,"
	echo "<P/>Please Confirm that you have received the following automated emails:"
	while [ $PrintCount -lt $CounterUp ];
	do
		x="CommID$PrintCount";
		y="PO$PrintCount";
		echo -e "<p/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${!x}, PO#'s:";
		echo -e "<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${!y}<p/>";
		PrintCount=$(( $PrintCount + 1 ));
	done
	echo -e "Regards,<br/>";
	echo -e "CSI";
	echo -e "\t\t\t\n\n\n\n"
	echo -e "."
	sleep 1.3
	echo "QUIT"
} | telnet smtp.ehost.com 25

else

{
	sleep 1.3
	echo "EHLO ehost.com"
	sleep 1.3
	#echo "AUTH LOGIN"
	echo "AUTH PLAIN AHBkYW5zaG92QGNzaS3NpODUxOTEy"
	sleep 1.3
	echo "MAIL FROM: pdanny.com"
	sleep 1.3
	echo "RCPT TO: pdanshsi-ny.com"
	sleep 1.3
	echo "RCPT TO: dhubeny.com"
	sleep 1.3
	echo "RCPT TO: jprusi-ny.com"
	sleep 1.3
	echo "RCPT TO: adyei-ny.com"
	sleep 1.3
	echo "DATA"
	sleep 2
	echo "from:CSI-HuitVM"
	sleep 1.3
	echo "to:CSI"
	sleep 1.3
	echo "cc:pdanshny.com"
	sleep 1.3
	echo "subject:Automated PO Emails Confirmation"
	sleep 1.3
	echo "MIME-Version: 1.0"
	sleep 1.3
	echo -e "Content-Type: text/html; charset=\"ISO-8859-1\""
	echo "<HTML>"
	echo "<HEAD>"
	echo "<meta http-equiv='content-type' content='text/html; charset=ISO-8859-1'>"
	echo "</HEAD>"
	echo "<BODY>"
	echo "<P/>This is an internal CSI placeholder email to confirm that the HUIT PO script ran - HUIT has not received any PO's today."
	echo -e "\t\t\t\n\n\n\n"
	echo -e "."
	sleep 1.3
	echo "QUIT"
} | telnet smtp.ehost.com 25

fi

FAFile='C:\MinGW\msys\1.0\TPPC_FA.txt'
if [ ! -z "$FAFile" ]; #check if var is not empty
then

{
	sleep 1.3
	echo "EHLO ehost.com"
	sleep 1.3
	#echo "AUTH LOGIN"
	echo "AUTH PLAIN AHBkYW5zaGb20AQ3NpODUxOTEy"
	sleep 1.3
	echo "MAIL FROM: pdansom"
	sleep 1.3
	echo "RCPT TO: pdancom"
	sleep 1.3
	echo "RCPT TO: jpruom"
	sleep 1.3
	echo "DATA"
	sleep 2
	echo "from:CSI-HuitVM"
	sleep 1.3
	echo "to:CSI"
	sleep 1.3
	echo "cc:pdan-ny.com"
	sleep 1.3
	echo "subject:FA Check"
	sleep 1.3
	echo "MIME-Version: 1.0"
	sleep 1.3
	echo -e "Content-Type: text/html; charset=\"ISO-8859-1\""
	echo "<HTML>"
	echo "<HEAD>"
	echo "<meta http-equiv='content-type' content='text/html; charset=ISO-8859-1'>"
	echo "</HEAD>"
	echo "<BODY>"
	echo "The following are UnAcknowledged TPPC 997's:<p/>"
	echo "<PRE>"
	while read line;
		do
			echo "$line <br/>";
	done < "$FAFile"
	echo "</PRE>"
	echo -e "\t\t\t\n\n\n\n"
	echo -e "."
	sleep 1.3
	echo "QUIT"
} | telnet smtp.ehost.com 25

fi

) 2>&1 | tee /PO_Check_Bash.log
