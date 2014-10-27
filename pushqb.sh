#!/usr/local/bin/bash

# Non-interactive mode
#smbclient //172.28.1.155/Admin liana121 -W mydomain_here -U miguel  <<EOC
# cd miguel
# put Screenshot.png
# EOC
#smbclient //172.28.1.155/Admin liana121 -U John
#sleep 5
#setmode filename perm=[+|-]rsha 	A version of the MS-DOS "attrib" command toset file permissions. For example,
#setmode myfile +r
#would make myfile read-only.
cd "/mnt/Data-2x1.5TbMirroredDrives/QB data/"
echo -e "\n $(date):\n" >> QBPushLog.txt
smbclient //172.28.1.155/Admin password -U user &>> QBPushLog.txt << EOC
setmode "Deal Trading.QBW" -r
put "Deal Trading.QBW"
quit
EOC
