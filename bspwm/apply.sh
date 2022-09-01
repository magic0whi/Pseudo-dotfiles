#!/bin/sh

[ -d ~/.config/bspwm ] || mkdir ~/.config/bspwm
[ -d ~/.config/sxhkd ] || mkdir ~/.config/sxhkd
cp bspwmrc ~/.config/bspwm/
cp sxhkdrc ~/.config/sxhkd/
sudo cp panel        /usr/local/bin/
sudo cp panel_bar    /usr/local/bin/
sudo cp panel_colors /usr/local/bin/

[ -d ~/.config/redshift ] || mkdir ~/.config/redshift
cp redshift.conf ~/.config/redshift/

pushd ./clock
make clean all
sudo make install
popd

cp stalonetrayrc ~/.config/
