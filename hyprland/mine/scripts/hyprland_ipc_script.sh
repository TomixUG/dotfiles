#!/bin/sh

: "${XDG_RUNTIME_DIR:?Environment variable XDG_RUNTIME_DIR not set}"
: "${HYPRLAND_INSTANCE_SIGNATURE:?Environment variable HYPRLAND_INSTANCE_SIGNATURE not set}"

handle() {
	case "$1" in
	monitorremoved* | monitoradded*)
		echo "monitor update!"
		/home/tomso/.config/hypr/scripts/monitors.sh
		;;
	esac
}

# Listen to events and handle them
socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while IFS= read -r line; do
	handle "$line"
done
