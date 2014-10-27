#!/usr/local/bin/bash

#This is the script that backs up File maker every day
JustTheDate=$(date +%a)
NameAndDate="Deal Trading $JustTheDate .fp7"
echo $NameAndDate

#Actual Cron Command
rsync -artvu --delete "/mnt/Data-2x1.5TbMirroredDrives/FileMaker/Production/Deal Trading.fp7" "/mnt/Data-2x1.5TbMirroredDrives/FileMaker/Production Backup/Daily 6PM/" && mv "/mnt/Data-2x1.5TbMirroredDrives/FileMaker/Production Backup/Daily 6PM/Deal Trading.fp7" "/mnt/Data-2x1.5TbMirroredDrives/FileMaker/Production Backup/Daily 6PM/$NameAndDate"

#Command to run the pricetrigger script
#Maybe....