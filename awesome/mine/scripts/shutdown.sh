#!/bin/bash

selection=$(echo -e "shutdown\nlogout\nreboot\nlock\nsuspend\nreload wm" | rofi -dmenu -auto-select -theme ~/.config/rofi/shutdown.rasi)

case $selection in
	shutdown) shutdown now ;;
  logout) kill -9 -1 ;;
	reboot) reboot ;;
	lock) slock ;;
	suspend) systemctl suspend ;;
	"reload wm") echo 'awesome.restart()' | awesome-client ;;
	*) ;;
esac
