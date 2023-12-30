#!/bin/sh
#xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1-0 --mode 1280x1024 --pos 1920x56 --rotate normal
#xrandr --output HDMI-0 --mode 1280x1024 --pos 1920x0 --rotate normal --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-1 --off
# old monitor:
# xrandr --output HDMI-0 --mode 1280x1024 --pos 1920x0 --rotate normal --output eDP-1-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-1 --off

xrandr --output HDMI-0 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output eDP-1-1 --mode 1920x1080 --pos 2560x360 --rotate normal --output DP-1-1 --off
xrandr --output HDMI-0 --mode 2560x1440 --rate 144
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
