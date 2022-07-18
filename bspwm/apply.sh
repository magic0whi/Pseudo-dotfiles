#!/bin/sh

[ -z ~/.config/bspwm ] || mkdir ~/.config/bspwm
[ -z ~/.config/sxhkd ] || mkdir ~/.config/sxhkd
cp bspwmrc ~/.config/bspwm/bspwmrc
cp sxhkdrc ~/.config/sxhkd/sxhkdrc
sudo cp panel        /usr/local/bin/
sudo cp panel_bar    /usr/local/bin/
sudo cp panel_colors /usr/local/bin/

cp redshift.conf ~/.config/redshift/

pushd ./clock
make clean all
sudo make install
popd
