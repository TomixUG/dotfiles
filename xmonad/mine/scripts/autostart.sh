#!/bin/sh
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1-0 --mode 1280x1024 --pos 1920x56 --rotate normal 
sleep 1

# fix mouse cursor
xsetroot -cursor_name left_ptr

# polybar
# ~/.config/polybar/launch.sh

## Power managment
xfce4-power-manager &

## Start Compositing Manager
exec picom &

## Notification daemon
exec dunst &

## Network manager
nm-applet --indicator &

blueman-applet &

## Mics
kdeconnect-indicator &
flameshot &
discord &


## Wallpaper
sleep 2
nitrogen --restore &
telegram-desktop -startintray &

# polkit
exec /usr/lib/mate-polkit/polkit-mate-authentication-agent-1
