#!/bin/sh
while true; do
	PID=`pidof swaybg`
	swaybg -i $(find ~/Images/Wallpapers/. -type f | shuf -n1) -m fill &
	sleep 1
	kill $PID
	sleep 600
done
