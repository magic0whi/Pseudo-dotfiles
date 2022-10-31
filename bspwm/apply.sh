#!/bin/sh

[ -d ~/.config/bspwm ] || mkdir ~/.config/bspwm
[ -d ~/.config/sxhkd ] || mkdir ~/.config/sxhkd
cp bspwmrc ~/.config/bspwm/
cp sxhkdrc ~/.config/sxhkd/

[ -d ~/.config/redshift ] || mkdir ~/.config/redshift
cp redshift.conf ~/.config/redshift/

cp stalonetrayrc ~/.config/
cp picom.conf ~/.config/picom/
cp polybar.ini ~/.config/polybar/config.ini
