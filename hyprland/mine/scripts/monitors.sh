#!/bin/bash

monitors=$(hyprctl monitors all)

# Check if both DP-1 and HDMI-A-2 are present
if [[ "$monitors" == *"Monitor DP-1"* && "$monitors" == *"Monitor HDMI-A-2"* ]]; then
	echo "both plugged in"
else
	echo "Either DP-1 or HDMI-A-2 monitors are not plugged in."
	# laptop mode
	hyprctl keyword monitor eDP-1,preferred,auto,1
fi
