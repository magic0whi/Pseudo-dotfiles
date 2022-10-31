#!/bin/sh

a1=('bspwmrc' 'sxhkdrc' 'redshift.conf' 'stalonetrayrc' 'picom.conf' 'polybar.ini')
a2=("${HOME}/.config/bspwm" "${HOME}/.config/sxhkd" "${HOME}/.config/redshift" "${HOME}/.config" "${HOME}/.config/picom" "${HOME}/.config/polybar/config.ini")


for ((i=0; i<${#a1[@]}; i++))
do
    if [ ! -e ${a2[$i]} ]; then
        echo ${a1[$i]} failed
    elif [ -d ${a2[$i]} ] && [[ $(sha256sum "${a1[$i]}" | awk '{print $1}') != $(sha256sum "${a2[$i]}/${a1[$i]}" | awk '{print $1}') ]]; then
        echo ${a1[$i]} failed
    elif [ -f ${a2[$i]} ] && [[ $(sha256sum ${a1[$i]} | awk '{print $1}') != $(sha256sum ${a2[$i]} | awk '{print $1}') ]]; then
        echo ${a1[$i]} failed
    fi
done
