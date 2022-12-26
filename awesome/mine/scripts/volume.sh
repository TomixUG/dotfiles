#!/bin/bash

case $1 in
up)
    pamixer -i 5
	;;
down)
    pamixer -d 5
	;;
mute)
    amixer set Master 1+ toggle
	;;
esac
