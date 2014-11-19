#!/bin/sh

CurrentDate=$(date |awk '{print $2, $3}')

FileDate=$(ls -al qk.nts |awk '{print $6, $7}')

CurrentTrigDate=$(date |awk '{print $1, $2, $3, $6}')

TriggerDate=$(cat trigger |awk '{print $1, $2, $3, $6}')

if [ "$CurrentDate" = "$FileDate" ]

#(date |awk '{print $2, $3}') = (ls -al qk.nts |awk '{print $6, $7}')

then

 if [ "$CurrentTrigDate" = "$TriggerDate" ]

 #(date |awk '{print $1, $2, $3, $6}') = (cat trigger |awk '{print $1, $2, $3, $6}')

 then

  #Do Nothing

 else

  date > trigger && ftp && open && 172.28.1.231 && DealTradingUser && dealt && cd && UnixF/pricetrigger && put && trigger && trigger && close

 fi

fi










