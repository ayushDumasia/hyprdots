#!/bin/sh

# Send a notification when the laptop is plugged in/unplugged
# Add the following to /etc/udev/rules.d/60-power.rules (replace USERNAME with your user)



export XAUTHORITY=~/.Xauthority
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

BATTERY_STATE=$1
BATTERY_LEVEL=$(acpi -b | grep "Battery 0" | grep -P -o '[0-9]+(?=%)')
# My battery takes a couple of seconds to recognize as charging, so this is a hacky way to deal with it
case "$BATTERY_STATE" in
	"charging") BATTERY_CHARGING="Charging" ; BATTERY_ICON="charging" ;;
	"discharging") BATTERY_CHARGING="Discharging" ; BATTERY_ICON="discharging" ;;
esac

# Send notification
notify-send "${BATTERY_CHARGING}" "${BATTERY_LEVEL}% of battery charged." -u normal -i "battery-${BATTERY_ICON}" -t 5000 -r 9991
