# !/usr/bash

CURRENT_BRIGHTNESS=$( brightnessctl -m | awk -F, '{print $4}' | tr -d % )
OLD_BRIGHTNESS=$( cat /etc/xdg/waybar/scripts/old-brightness.txt )

if [ "$CURRENT_BRIGHTNESS" -ne 1 ] ; then
	echo "$CURRENT_BRIGHTNESS" > /etc/xdg/waybar/scripts/old-brightness.txt;
	brightnessctl set 1%;
else	
	brightnessctl set "$OLD_BRIGHTNESS"%;
fi
