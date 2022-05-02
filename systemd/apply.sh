#!/bin/bash

cp acpid.timer /etc/systemd/system/
cp acpid.service /etc/systemd/system/
cp acpid /usr/local/bin/

cp surface-hibernate-pre.service /etc/systemd/system/
cp surface-hibernate-post.service /etc/systemd/system/
