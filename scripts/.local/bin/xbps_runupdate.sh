#!/bin/sh

sudo xbps-install -Su
pkill -SIGRTMIN+8 waybar
echo "Push to exit..."
read nm
exit
