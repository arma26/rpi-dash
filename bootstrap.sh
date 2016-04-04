#!/bin/sh

# sudo raspi-config
#	expand filesystem
# 	boot to terminal (default)
#	enable ssh server
# tip: ctrl+alt+f1 changes to terminal

if [ -z "$1" ]; then
	echo "You must include a URL for the dashboard";
	echo "example: sudo ./boostrap.sh http://example.com/dashboard/#rpi7";
	exit;
fi

sudo apt-get install -y vim midori unclutter ttf-mscorefonts-installer matchbox
sudo apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y
sudo sed -i 's/XKBLAYOUT.*/XKBLAYOUT="us"/g' /etc/default/keyboard
sudo sed -i 's/#disable_overscan=1/disable_overscan=1/g' /boot/config.txt
#sudo sed -i 's/#xserver-command=X/xserver-command=X -s 0 dpms/g' /etc/lightdm/lightdm.conf
sudo cp /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
sudo cp rc.local /etc/rc.local
sudo sed -i "s%#url#%$1%g" /etc/rc.local
sudo cp restart-pi /etc/cron.d/restart-pi

sudo cp restart_midori.sh /home/pi/restart_midori.sh
sudo chmod +x ~/restart_midori.sh

sudo reboot
