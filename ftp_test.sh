#!/bin/sh

ftp -in 172.28.1.231 << EOF > /usr/desktop/ftplog
user DealTradingUser dealt
binary
cd /UnixF/pricetrigger/
#get trigger
put /usr/desktop/trigger trigger
ls
bye
quit
EOF
