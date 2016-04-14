#!/bin/sh

# raspi-config
# expand filesystem
# boot to terminal (default)
# enable ssh server
# expand filesystem (reboot if you do this, first)
# tip: ctrl+alt+f1 changes to terminal

if [ -z "$1" ]; then
	echo "You must include a URL for the dashboard";
	echo "example: as root, ./boostrap.sh http://example.com/dashboard/#rpi7";
	exit;
fi

apt-get install -y vim midori unclutter ttf-mscorefonts-installer matchbox xinit
apt-get update -y && apt-get upgrade -y && apt-get dist-upgrade -y
sed -i 's/XKBLAYOUT.*/XKBLAYOUT="us"/g' /etc/default/keyboard
sed -i 's/#disable_overscan=1/disable_overscan=1/g' /boot/config.txt
#sed -i 's/#xserver-command=X/xserver-command=X -s 0 dpms/g' /etc/lightdm/lightdm.conf
cp /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
cp rc.local /etc/rc.local
sed -i "s%#url#%$1%g" /etc/rc.local
cp restart-pi /etc/cron.d/restart-pi

cp restart_midori.sh /home/pi/restart_midori.sh
chown pi:pi /home/pi/restart_midori.sh
chmod +x /home/pi/restart_midori.sh

reboot
