#!/bin/bash

max="$(cat /sys/class/backlight/intel_backlight/max_brightness)"
current="$(cat /sys/class/backlight/intel_backlight/brightness)"

case $1 in
up)
    echo $(awk "BEGIN { print int($current + ($max*0.1)) }") > /sys/class/backlight/intel_backlight/brightness
	;;
down)
    echo $(awk "BEGIN { print int($current - ($max*0.1)) }") > /sys/class/backlight/intel_backlight/brightness
	;;
esac
