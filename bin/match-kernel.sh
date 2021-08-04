#!/bin/bash

RUNNING=$(uname -r)
INSTALLED=$(pacman -Q linux | awk '{print $2}' | sed 's/\.arch/-arch/')

if [[ $RUNNING = $INSTALLED ]]; then
    exit 0
fi

exit 1
