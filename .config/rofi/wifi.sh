#!/usr/bin/env bash

# Notify user of Wi-Fi scanning
notify-send "Scanning Wi-Fi networks..."

# Get the active Wi-Fi connection
active_wifi=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)

# Get list of available Wi-Fi networks, exclude the active one if there is one
wifi_list=$(nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed 's/  */ /g' \
  | sed -E "s/WPA*.?\S/ /g" | sed "s/^--/ /g" | sed "s/  //g" | sed "/--/d")

# Remove the active Wi-Fi from the list if it exists
if [[ -n "$active_wifi" ]]; then
    wifi_list=$(echo "$wifi_list" | grep -v "$active_wifi")
fi

# Get current Wi-Fi state (enabled/disabled)
connected=$(nmcli -fields WIFI g)
if [[ "$connected" =~ "enabled" ]]; then
    toggle="󰖪  Disable"
elif [[ "$connected" =~ "disabled" ]]; then
    toggle="󰖩  Enable"
else
    notify-send "Error" "Unable to determine Wi-Fi state."
    exit 1
fi

# Icons for UI
wifi_icon="󰖩  "
active_icon="󰤥  "

# Build the menu: Show active Wi-Fi at top only if it exists
if [[ -n "$active_wifi" ]]; then
    wifi_menu="$active_icon $active_wifi\n$wifi_list"
else
    wifi_menu="$wifi_list"
fi

# Add toggle Wi-Fi state option at the top
wifi_menu="$toggle\n$wifi_menu"

# Prompt user to choose a network or toggle Wi-Fi state
chosen_network=$(echo -e "$wifi_menu" | uniq -u | rofi -dmenu -i -selected-row 1 -p "Wi-Fi SSID: ")

# Get the chosen network ID (strip the icon)
chosen_id="${chosen_network:3}"

# If nothing was selected, exit cleanly
if [[ -z "$chosen_network" ]]; then
    exit 0
fi

# Enable or disable Wi-Fi
if [[ "$chosen_network" = "󰖩  Enable" ]]; then
    nmcli radio wifi on && notify-send "Wi-Fi Enabled"
    exit 0
elif [[ "$chosen_network" = "󰖪  Disable" ]]; then
    nmcli radio wifi off && notify-send "Wi-Fi Disabled"
    exit 0
fi

# Connection logic
success_message="You are now connected to the Wi-Fi network \"$chosen_id\"."

# Check if the chosen network is saved
saved_connections=$(nmcli -g NAME connection)
if [[ $(echo "$saved_connections" | grep -w "$chosen_id") == "$chosen_id" ]]; then
    # Connect to the saved network
    if nmcli connection up id "$chosen_id" | grep -q "successfully"; then
        notify-send "$wifi_icon Connection Established" "$success_message"
    else
        notify-send "Error" "Failed to connect to \"$chosen_id\"."
    fi
else
    # Prompt for password if network is protected
    if [[ "$chosen_network" =~ "" ]]; then
        wifi_password=$(rofi -dmenu -password -p "Enter Password for \"$chosen_id\":")
        
        # Exit if no password is provided
        if [[ -z "$wifi_password" ]]; then
            notify-send "Error" "Password required for \"$chosen_id\"."
            exit 1
        fi
    fi
    
    # Attempt to connect to the new network (with or without password)
    if [[ -n "$wifi_password" ]]; then
        if nmcli device wifi connect "$chosen_id" password "$wifi_password" | grep -q "successfully"; then
            notify-send "Connection Established" "$success_message"
        else
            notify-send "Error" "Failed to connect to \"$chosen_id\"."
        fi
    else
        # Connect to an open network
        if nmcli device wifi connect "$chosen_id" | grep -q "successfully"; then
            notify-send "Connection Established" "$success_message"
        else
            notify-send "Error" "Failed to connect to \"$chosen_id\"."
        fi
    fi
fi

