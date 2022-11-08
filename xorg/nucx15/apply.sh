#!/bin/bash

sudo cp Xwrapper.config /etc/X11/Xwrapper.config
sudo cp 10-monitor.conf /etc/X11/xorg.conf.d/10-monitor.conf
sudo cp 30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
cp Xresources.Xresources ~/.Xresources

cp drirc.drirc ~/.drirc
