#!/bin/sh

source ./files.sh

for ((i=0; i<${#a1[@]}; i++))
do
    if [ ! -d ${a2[$i]} ]; then
        echo ${a1[$i]} failed. Directory ${a2[$i]} does not exist!
    elif [[ $(sha256sum "${a1[$i]%:*}" | awk '{print $1}') != $(sha256sum "${a2[$i]}/${a1[$i]#*:}" | awk '{print $1}') ]]; then
        echo ${a1[$i]} failed
    fi
done
