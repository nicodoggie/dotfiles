#!/bin/bash

RUNNING=$(uname -r)
INSTALLED=$(pacman -Q linux | awk '{print $2}')

if [[ $RUNNING != $INSTALLED ]]; then
    echo -ne "Needs Reboot"
else
    echo -ne $RUNNING;
fi


