#!/bin/bash
(
#########################################################################
####
###
##
## 						 Peter Danshov 10.27.14
##                         pdanshv@gmail.com
##			A bash script to auto update a directory of git repos
##
###
####
#########################################################################

cd /C/
cd Users
cd Administrator
cd Documents
cd Git_Folders
cd /c/Users/Administrator/Documents/Git_Folders

time=$(date)

set -x
# create an array with all the filer/dir inside ~/myDir
#arr=(~/myDir/*)
#arr=("/Users/Administrator/Documents/Git Folders/*")
# iterate through array using a counter
#for ((i=0; i<${#arr[@]}; i++)); do
    #do something to each element of array
#    echo "${arr[$i]}"
#done

#shopt -s dotglob
#shopt -s nullglob
array=(*/)
#for dir in "${array[@]}"; do echo "$dir"; done
#for dir in */; do echo "$dir"; done

for ((i=0; i<${#array[@]}; i++)); do
    #do something to each element of array
    echo "${array[$i]}"
	cd "${array[$i]}"
	repo="${array[$i]}"
	repo="${repo%?}"
	git add *
	git commit -m "$time"
	git push --repo https://pd:anv3@github.com/pdanshov/"$repo"".git"
	sleep 3
	cd ../
done
) 2>&1 | tee /Git_Bash.Log
