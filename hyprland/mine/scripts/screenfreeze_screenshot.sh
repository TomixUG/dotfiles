#!/bin/bash

fileName="$(uuidgen).png"

slurp=$(slurp)
mkdir /tmp/assist
grim -g "$slurp" /tmp/assist/$fileName

echo $slurp

x=$(echo $slurp | awk -F'[ ,]' '{print $1}')
y=$(echo $slurp | awk -F'[ ,]' '{print $2}')

# Monitor resolution for DP-1 (adjust this if using a different monitor)
MONITOR_WIDTH=2560
MONITOR_HEIGHT=1440

# Calculate center-based coordinates for moveactive
center_x=$((x - MONITOR_WIDTH / 2))
center_y=$((y - MONITOR_HEIGHT / 2))

swayimg -s real -a freeze --config="font.color=#00000000" --config="font.shadow=#00000000" /tmp/assist/$fileName &
sleep 0.5

rm /tmp/assist/$fileName

# hyprctl dispatch moveactive $center_x $center_y
