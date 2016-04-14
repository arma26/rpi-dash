rpi-dash
--------
The purpose of this project is to take a freshly provisioned raspberry pi, run the bootstrap script and have a fullscreen browser pointed at a webpage when it finishes.

Thing this script handles for you:

 - install a browser, configure the windows manager
 - upgrade the raspbian distribution
 - set keyboard layout to US
 - disable overscan for use with monitors
 - set timezone
 - set a cron that reboots the Pi every 24hours for consistency

Usage
-----
Do this before running the script:
- expand the filesystem
- enable ssh
- configure network settings / hostnames

As root
`./bootstrap.sh <dashboard url here>`
