#!/bin/sh
/usr/bin/acpi -b | /usr/bin/awk -F'[,:%]' '{if ($3!=0) print $2, $3}' | {
    read -r status capacity

    if [ "$status" = Discharging -a "$capacity" -lt 10 ]; then
        /usr/bin/logger "Critical battery threshold"
        /usr/bin/systemctl hibernate
    fi
}
