#!/bin/sh

# wallpaper
waypaper --restore &

# bar
waybar &

## Power managment
hypridle &

## Network manager
nm-applet --indicator &

blueman-applet &

## Mics
kdeconnect-indicator &
flameshot &
telegram-desktop -startintray &

kdeconnectd &

# polkit
exec /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &

# touchpad
exec /home/tomso/tools/libinput-three-finger-drag &

sleep 5

/home/tomso/.config/hypr/scripts/monitors.sh
vesktop &

sleep 5
/home/tomso/.config/hypr/scripts/hyprland_ipc_script.sh &
