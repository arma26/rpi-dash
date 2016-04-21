#!/usr/bin/env bash

sed -i 's/XKBLAYOUT.*/XKBLAYOUT="us"/g' /etc/default/keyboard
exit 0
