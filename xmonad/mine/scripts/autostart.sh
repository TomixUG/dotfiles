#!/bin/sh
#xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1-0 --mode 1280x1024 --pos 1920x56 --rotate normal
#xrandr --output HDMI-0 --mode 1280x1024 --pos 1920x0 --rotate normal --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-1 --off
# old monitor:
# xrandr --output HDMI-0 --mode 1280x1024 --pos 1920x0 --rotate normal --output eDP-1-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-1 --off
#xrandr --output HDMI-0 --set Border 80,160,0,80
# xrandr --output HDMI-0 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output eDP-1-1 --mode 1920x1080 --pos 2560x360 --rotate normal --output DP-1-1 --off
# xrandr --output HDMI-0 --mode 2560x1440 --rate 144
#xrandr --output eDP-1 --mode 1920x1080 --pos 2560x252 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --primary --mode 2560x1440 --pos 0x0 --rotate normal
xrandr --output eDP-1 --mode 1920x1080 --pos 2560x180 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output HDMI-2 --off
sleep 1

xinput --set-prop 12 'libinput Accel Speed' -0.45

# fix mouse cursor
xsetroot -cursor_name left_ptr

# polybar
# ~/.config/polybar/launch.sh

## Power managment
xfce4-power-manager &

## Start Compositing Manager
# exec picom &
exec xcompmgr &

## Notification daemon
exec dunst &

## Network manager
nm-applet --indicator &

blueman-applet &

## Mics
kdeconnect-indicator &
flameshot &
vesktop &
telegram-desktop -startintray &

## Wallpaper
sleep 2
nitrogen --restore &

kdeconnectd &

# polkit
exec /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &

# touchpad
exec /home/tomso/tools/libinput-three-finger-drag &
