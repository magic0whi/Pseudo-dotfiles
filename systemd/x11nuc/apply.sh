#!/bin/bash

sudo cp acpid.timer /etc/systemd/system/
sudo cp acpid.service /etc/systemd/system/
sudo cp acpid /usr/local/bin/
sudo cp systemd-networkd/* /etc/systemd/network/
