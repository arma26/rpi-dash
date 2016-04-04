#!/bin/bash
rm -f ~/.config/midori/session.xbel
xset -dpms       # disable DPMS (Energy Star) features.
xset s off       # disable screen saver
xset s noblank   # dont blank the video device
unclutter -idle 0 &
matchbox-window-manager &
midori -e Fullscreen -a $1 -i 3600
