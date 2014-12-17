
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
umount /C
mount X: /SourceBakDir
#mount /C/ /cdrive
mount "C:/" "/C"

cd /SourceBakDir
#ls -al

#cd /C
#ls -al


# Is there a TRY CATCH command in Bash?
# No.
# Bash doesn't have all luxury as you can find in many programming language and also it's true that bash doesn't have less luxury than other programming language.
# There is not really a try/catch in bash but you can achieve a quite similar behavior using && or ||
# Using ||
# if command1 fails then you will run command2 as follows
# command1 || command2
# similar using && you can run command2 if command1 successful
# Now if you want exact flavor of try/catch then try it
# { # this is my bash try block
    # command1 &&
    # #save your output
# } || { # this is catch block
    # # save log for exception 
# }

### rsync -artvu --delete "/C/Users/Administrator/Desktop" "Backup/SourceBackup/Joe/"
#sleep 3
### rsync -artvu --delete "/C/Program Files/Open Systems, Inc/TRAVERSE MODS" "Backup/SourceBackup/Joe/"

echo `date` >> Backup/SourceBackup/Joe/log.log


# Bash Experimental Try/Except Block
########################################################################################################
#{
	rsync -artvu --delete "/C/Program Files/Open Systems, Inc/TRAVERSE MODS" "Backup/SourceBackup/Joe/" &&
	echo " - TravMods Done" >> Backup/SourceBackup/Joe/log.log #&&
	#rsync -artvu --delete "/C/Users/Administrator/Desktop" "Backup/SourceBackup/Joe/"
#} || {
#	rsync -artvu --delete "/C/Users/Administrator/Desktop" "Backup/SourceBackup/Joe/"
#}


echo " - done."$'\r' >> Backup/SourceBackup/Joe/log.log && rsync -artvu --delete "/C/Users/Administrator/Desktop" "Backup/SourceBackup/Joe/" && echo " - Completed Desktop."$'\r' >> Backup/SourceBackup/Joe/log.log
# echo "$(date) - completed." >> Backup/SourceBackup/Joe/log.log


umount /SourceBakDir
umount /C

) 2>&1 | tee /SourceBak_Bash.log




