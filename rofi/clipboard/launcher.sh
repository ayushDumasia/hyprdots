#!/usr/bin/env bash

## Directory and theme setup
dir="$HOME/.config/rofi/clipboard/"
theme='style'

echo ${dir}

## Clipboard Search with Rofi and custom theme
cliphist list | awk '{$1=""; print $0}' | rofi -dmenu -i -p "Search" -theme ${dir}/${theme}.rasi | wl-copy

