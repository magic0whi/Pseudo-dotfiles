#!/bin/sh

echo $(($(cat /sys/class/power_supply/BAT0/voltage_now)*$(cat /sys/class/power_supply/BAT0/current_now)/1000000000000))W
