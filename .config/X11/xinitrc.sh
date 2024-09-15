#!/bin/sh

if [ -f "$XDG_CONFIG_HOME/.config/x11/xprofile" ]; then
	. "$XDG_CONFIG_HOME/.config/x11/xprofile"
else
	. "$HOME/.xprofile"
fi

# . "$HOME/.profile"

fav=bspwm
case "$1" in
	bspwm) bspwm ;;
	xfce) startxfce4 ;;
	*) exec $fav ;;
esac
