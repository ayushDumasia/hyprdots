# !/usr/bash

sleep 60s

PACMAN_UPDATES_COUNT=$( checkupdates | wc -l)

sleep 30s

AUR_UPDATES_COUNT=$(pacman -Qm | aur vercmp | wc -l)

sleep 30s

TOTAL_UPDATES_COUNT=$((PACMAN_UPDATES_COUNT+AUR_UPDATES_COUNT))

if [ $TOTAL_UPDATES_COUNT -gt 0 ] ; then
	echo -e "\uf019"
fi
