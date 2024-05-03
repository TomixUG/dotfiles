#!/bin/bash

ACTIVE=$(pactl list sinks | grep "Active Port:" | tail -1 | cut --delimiter=" " --fields 3)

# print it for the bar
if [[ $1 = 'p' ]]; then
	if [[ $ACTIVE = 'analog-output-speaker' ]]; then
		echo "󰓃"
	elif [[ $ACTIVE = 'analog-output-headphones' ]]; then
		echo ""
	fi
	exit 0
fi

# change it
echo "setting microphone to headset"
pactl set-source-port 53 analog-input-headset-mic

if [[ $ACTIVE = 'analog-output-speaker' ]]; then
	echo "[speaker] setting to headphones..."
	pactl set-sink-port 52 analog-output-headphones
elif [[ $ACTIVE = 'analog-output-headphones' ]]; then
	echo "[headphones] setting to speaker..."
	pactl set-sink-port 52 analog-output-speaker
fi
