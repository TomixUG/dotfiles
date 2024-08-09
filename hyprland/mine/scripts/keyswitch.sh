#!/bin/bash

# TODO: be able to switch between more than 2 layouts

if hyprctl devices | grep -q "English"; then
	hyprctl keyword input:kb_layout "cz(qwerty)"
	dunstify -u critical -r 8888 "Keyboard layout:" "cz" -t 2000
else
	hyprctl keyword input:kb_layout us
	dunstify -u critical -r 8888 "Keyboard layout:" "us" -t 2000
fi
