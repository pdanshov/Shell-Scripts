#!/usr/local/bin/bash

CurrentDate=$(date |awk '{print $1, $2, $3, $6}')
TriggerDate=$(cat /mnt/Data-2x1.5TbMirroredDrives/UnixF/pricetrigger/trigger |awk '{print $1, $2, $3, $6}')
Trigger=$(cat /mnt/Data-2x1.5TbMirroredDrives/UnixF/pricetrigger/trigger)
#TriggerGrep=$(cat trigger |grep done)
TriggerGrep=$(grep -c "done" /mnt/Data-2x1.5TbMirroredDrives/UnixF/pricetrigger/trigger)
echo
echo Open
echo $CurrentDate
echo $TriggerDate
echo $Trigger
echo $TriggerGrep
echo Close
echo
if [ "$CurrentDate" = "$TriggerDate" ]
then
 #mail -s "In First Loop" pdanshv@gmail.com < "None"
 if [ "$TriggerGrep" = 1 ]
 then
  #mail -s "In Second Loop" pdanshv@gmail.com < "done detected"
  #Do Nothing
  echo Exists
  echo "$CurrentDate - Exists" >> /mnt/Data-2x1.5TbMirroredDrives/UnixF/pricetrigger/triggerlog
 else
  mail -s "UNIX Pricing Updated" pdanshv@gmail.com < /mnt/Data-2x1.5TbMirroredDrives/UnixF/pricetrigger/trigger
  echo "$Trigger done" > /mnt/Data-2x1.5TbMirroredDrives/UnixF/pricetrigger/trigger
  echo emailed
  echo "$CurrentDate - emailed" >> /mnt/Data-2x1.5TbMirroredDrives/UnixF/pricetrigger/triggerlog
 fi
else
 echo Doesn\'t Match Today\'s Date
 echo "$CurrentDate - Doesn\'t Match Today\'s Date" >> /mnt/Data-2x1.5TbMirroredDrives/UnixF/pricetrigger/triggerlog
 exit
fi

