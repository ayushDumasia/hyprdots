# !/usr/bash

if [ $(pgrep -c hyprpaper) -ne 0 ] ; then
	hyprctl hyprpaper unload all
	killall hyprpaper
fi

TARGET="/home/archer/Downloads/wallpaper"
WALLPAPER=$( find $TARGET -type f -regex '.*\.\(jpg\|jpeg\|png\|webp\)' | shuf -n 1 )

echo "preload = $WALLPAPER" > /home/archer/.config/hypr/hyprpaper.conf
echo "wallpaper = eDP-1, $WALLPAPER" >> /home/archer/.config/hypr/hyprpaper.conf
echo "splash = off" >> /home/archer/.config/hypr/hyprpaper.conf
echo "ipc = off" >> /home/archer/.config/hypr/hyprpaper.conf
