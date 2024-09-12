#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Favorite Applications

# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Theme Elements
mesg="Installed Packages: $(pacman -Q | wc -l) (pacman) | Date:$(date '+ %a %d %H:%M')"


if [[ ( "$theme" == *'type-1'* ) || ( "$theme" == *'type-3'* ) || ( "$theme" == *'type-5'* ) ]]; then
	list_col='1'
	list_row='1'
elif [[ ( "$theme" == *'type-2'* ) || ( "$theme" == *'type-4'* ) ]]; then
	list_col='6'
	list_row='2'
fi

# CMDs (add your apps here)
term_cmd='kitty'
file_cmd='yazi'
text_cmd='obsidian'
web_cmd='firefox'
music_cmd='kitty -e ncmpcpp'
setting_cmd='xfce4-settings-manager'

# Options
layout=`cat ${theme} | grep 'USE_ICON' | cut -d'=' -f2`
if [[ "$layout" == 'NO' ]]; then
	option_1=" Terminal <span weight='light' size='small'><i>($term_cmd)</i></span>"
	option_2=" Files <span weight='light' size='small'><i>($file_cmd)</i></span>"
	option_3=" Editor <span weight='light' size='small'><i>($text_cmd)</i></span>"
	option_4=" Browser <span weight='light' size='small'><i>($web_cmd)</i></span>"
	option_5=" Music <span weight='light' size='small'><i>($music_cmd)</i></span>"
	option_6=" Settings <span weight='light' size='small'><i>($setting_cmd)</i></span>"
else
	option_1=""
	option_2=""
	option_3=""
	option_4=""
	option_5=""
	option_6=""
fi

# Rofi CMD
rofi_cmd() {
	rofi -theme-str "listview {columns: $list_col; lines: $list_row;}" \
		-dmenu \
		-p "$prompt" \
		-mesg "$mesg" \
		-markup-rows \
		-theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi_cmd
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		${term_cmd}
	elif [[ "$1" == '--opt2' ]]; then
		${file_cmd}
	elif [[ "$1" == '--opt3' ]]; then
		${text_cmd}
	elif [[ "$1" == '--opt4' ]]; then
		${web_cmd}
	elif [[ "$1" == '--opt5' ]]; then
		${music_cmd}
	elif [[ "$1" == '--opt6' ]]; then
		${setting_cmd}
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		run_cmd --opt1
        ;;
    $option_2)
		run_cmd --opt2
        ;;
    $option_3)
		run_cmd --opt3
        ;;
    $option_4)
		run_cmd --opt4
        ;;
    $option_5)
		run_cmd --opt5
        ;;
    $option_6)
		run_cmd --opt6
        ;;
esac
