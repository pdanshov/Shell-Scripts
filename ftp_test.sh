#!/bin/sh

ftp -in 111.111.111.111*dealnasipaddress* << EOF > /usr/desktop/ftplog
user username password
binary
cd /UnixF/pricetrigger/
#get trigger
put /usr/desktop/trigger trigger
ls
bye
quit
EOF
