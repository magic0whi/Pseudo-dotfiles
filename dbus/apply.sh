#!/bin/sh
[ -d /etc/dbus-1/system.d ] || sudo mkdir -p /etc/dbus-1/system.d
sudo cp iwd-allow-read.conf /etc/dbus-1/system.d
