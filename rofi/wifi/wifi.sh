#!/usr/bin/env bash

# Check if wifi is on
check_wifi_on=$( nmcli --field WIFI g | sed 1d | sed 's/ //g' )

# Get the SSID of the connected wifi network
connected_wifi=$( nmcli -t -f active,ssid device wifi | grep -i 'yes' | sed 's/yes://g' )

# Get the list of all avalaible wifi network
wifi_list=$( nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed -E "s/WPA*.?//g"| sed "s/802.1X//g" | sed "s/^--/ /g" | sed "s/ //g" | sed "/--/d" | sed "s/   */   /g" | sed 's/[[:space:]]*$//' )

# Generate the string to pass on
if [ -z "$connected_wifi" ] ; then
	string_to_pass=""
else
	string_to_pass="   Connected to ${connected_wifi}\n"
fi


# Rofi skeleton for enable
enable_menu() {
	rofi -markup-rows -dmenu -theme "$HOME/.config/rofi/wifi/enable.rasi"
}

# Rofi skeleton for list
list_menu() {
	rofi -markup-rows -dmenu -theme "$HOME/.config/rofi/wifi/list.rasi"
}


# Rofi menu for wifi enable
enable_wifi() {
	echo -e "󰤨   Enable Wifi" | enable_menu
}

# Rofi menu for the wifi list
list_wifi() {
	echo -e "󰤭   Disable Wifi\n${string_to_pass}   Manual Setup\n${wifi_list}" | list_menu
}

# Rofi menu for the details of the active connection
show_details() {
	rofi -e "${details}"
}

# Rofi menu for the ssid
take_ssid() {
	ssid=$( echo "" | rofi -dmenu -p "${choice}" -theme "$HOME/.config/rofi/wifi/ssid.rasi" )
}

# Rofi menu for the password
take_password() {
	password=$( echo "" | rofi -dmenu -p "${choice}" -theme "$HOME/.config/rofi/wifi/password.rasi" )
}

# Show the menu accordingly
if [ "$check_wifi_on" == "enabled" ] ; then 
	choice=$(list_wifi)
else
	choice=$(enable_wifi)
fi


# Remove the junk from the string
choice="${choice:4}"

# Perform tasks based on the choice
if [ "$choice" == "Enable Wifi" ] ; then
	nmcli radio wifi on
elif [ "$choice" == "Disable Wifi" ] ; then
	nmcli radio wifi off
elif [ "$choice" == "Manual Setup" ] ; then
	take_ssid
	if [[ "$ssid" != "" ]] ; then
		take_password	
		nmcli device wifi connect "$ssid" hidden yes password "$password"
	fi
elif [[ $choice =~ "Connected to" ]] ; then
	kitty -e sh -c "nmcli dev wifi show-password; read -p 'Press Return to close...'"
elif [[ $choice != "" ]] ; then	
	take_password
	nmcli device wifi connect "$choice" password "$password"
fi
