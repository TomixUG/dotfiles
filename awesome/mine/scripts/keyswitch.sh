#!/bin/bash

# TODO: be able to switch between more than 2 layouts

layout=$(setxkbmap -query | grep layout | awk '{print substr($0, length($0)-1)}')

if [ "$layout" == "cz" ]; then
    setxkbmap us
    dunstify -u critical -r 8888 "Keyboard layout:"  "us" -t 2000
else
    setxkbmap -layout cz -variant qwerty
    dunstify -u critical -r 8888 "Keyboard layout:"  "cz" -t 2000
fi

