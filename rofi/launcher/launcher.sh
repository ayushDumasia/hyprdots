#!/usr/bin/env bash

dir="$HOME/.config/rofi/launcher/"
theme='style'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
