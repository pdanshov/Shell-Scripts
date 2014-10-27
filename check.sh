#!/bin/sh
CurrentDate=`date |awk '{print $2, $3}'`
FileDate=`ls -al /usr/desktop/qk.nts |awk '{print $6, $7}'`
CurrentTrigDate=`date |awk '{print $1, $2, $3, $6}'`
TriggerDate=`cat /usr/desktop/trigger |awk '{print $1, $2, $3, $6}'`
echo if CurrentDate ${CurrentDate?} = FileDate ${FileDate?} 
echo Loop Outer
echo if CurrentTrigDate ${CurrentTrigDate?} = TriggerDate ${TriggerDate?}
echo Loop Inner
HOST='172.28.1.231'
USER='DealTradingUser'
PASSWD='dealt'
FILE='/usr/desktop/trigger'
RFILE='UnixF/pricetrigger/trigger'
LOG='/usr/desktop/ftp_log'
if [ "$CurrentDate" = "$FileDate" ]; 
then
  echo "Inside"
  if [ "$CurrentTrigDate" = "$TriggerDate" ];
  then
   echo "Skip FTP"
  else
   echo "Send FTP"
   #echo "$CurrentTrigDate" > /usr/desktop/trigger
   date > /usr/desktop/trigger 
   sh /usr/desktop/ftp_test.sh
  fi
else
  echo "Skipped All"
fi

