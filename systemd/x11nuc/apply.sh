#!/bin/sh

source ./files.sh

for ((i=0; i<${#a1[@]}; i++))
do
    if [ ! -d ${a2[$i]} ]; then
        echo Create directory ${a2[$i]}
        mkdir -p ${a2[$i]}
        echo Copy file ${a1[$i]%:*} to "${a2[$i]}/${a1[$i]#*:}"
        cp ${a1[$i]%:*} "${a2[$i]}/${a1[$i]#*:}"
    elif [[ $(sha256sum "${a1[$i]%:*}" | awk '{print $1}') != $(sha256sum "${a2[$i]}/${a1[$i]#*:}" | awk '{print $1}') ]]; then
        echo Update file ${a1[$i]%:*} to "${a2[$i]}/${a1[$i]#*:}"
        cp ${a1[$i]%:*} "${a2[$i]}/${a1[$i]#*:}"
    fi
done
