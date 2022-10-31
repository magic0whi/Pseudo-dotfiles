#!/bin/sh

a1=('bspwmrc' 'sxhkdrc' 'redshift.conf' 'picom.conf' 'polybar.ini:config.ini')
a2=("${HOME}/.config/bspwm" "${HOME}/.config/sxhkd" "${HOME}/.config/redshift" "${HOME}/.config/picom" "${HOME}/.config/polybar")


for ((i=0; i<${#a1[@]}; i++))
do
    if [ ! -d ${a2[$i]} ]; then
        echo ${a1[$i]} failed. Directory ${a2[$i]} does not exist!
    elif [[ $(sha256sum "${a1[$i]%:*}" | awk '{print $1}') != $(sha256sum "${a2[$i]}/${a1[$i]#*:}" | awk '{print $1}') ]]; then
        echo ${a1[$i]} failed
    fi
done
