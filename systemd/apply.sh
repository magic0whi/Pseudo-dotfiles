#!/bin/bash

sudo cp acpid.timer /etc/systemd/system/
sudo cp acpid.service /etc/systemd/system/
sudo cp acpid /usr/local/bin/

sudo cp surface-hibernate-pre.service /etc/systemd/system/
sudo cp surface-hibernate-post.service /etc/systemd/system/
