
#!/bin/sh
(
#########################################################################
####
###
## 						 Peter Danshov 11.18.14
##                         pdanshv@gmail.com
## 			A bash script to incrementally backup source code
##
##       Logs are in C:\MinGW\msys\1.0\
###
####
#########################################################################

set -x

umount /SourceBakDir
mount X: /SourceBakDir
#mount /C/ /cdrive
mount "C:/" "/C"

cd /SourceBakDir
#ls -al

#cd /C
#ls -al

rsync -artvu --delete "/C/Program Files/Open Systems, Inc/ClientSource" "Backup/SourceBackup/Peter/"

echo -e "\n
" >> Backup/SourceBackup/Peter/log.log
echo `date` >> Backup/SourceBackup/Peter/log.log
# echo "$(date) - completed." >> Backup/SourceBackup/Peter/log.log

umount /SourceBakDir
umount /C

) 2>&1 | tee /SourceBak_Bash.log
