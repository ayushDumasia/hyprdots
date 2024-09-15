#!/bin/sh

killall -9 pipewire pipewire-pulse wireplumber xcape

pipewire &
pipewire-pulse &
wireplumber &
xcape -e 'Super_L=Control_L|Escape' &
