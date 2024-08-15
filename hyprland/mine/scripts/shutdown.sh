#!/bin/bash

selection=$(echo -e "shutdown\nlogout\nreboot\nlock\nsuspend\nturn off screen" | rofi -dmenu -auto-select -theme ~/.config/rofi/shutdown.rasi)

case $selection in
shutdown) shutdown now ;;
logout) loginctl terminate-user $USER ;;
reboot) reboot ;;
lock) hyprlock ;;
suspend) systemctl suspend ;;
"turn off screen") hyprctl dispatch dpms off ;;
*) ;;
esac
