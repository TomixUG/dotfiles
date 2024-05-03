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

SINKOUT=$(pactl list sinks | grep "Sink #" | tail -1 | cut --delimiter=" " --fields 2 | cut -c 2-)
SINKIN=$(pactl list sources | grep "Source #" | tail -1 | cut --delimiter=" " --fields 2 | cut -c 2-)

# change it
echo "setting microphone to headset"
pactl set-source-port $SINKIN analog-input-headset-mic

if [[ $ACTIVE = 'analog-output-speaker' ]]; then
	echo "[speaker] setting to headphones..."
	notify-send -r 6322 "setting to headphones..."
	pactl set-sink-port $SINKOUT analog-output-headphones
elif [[ $ACTIVE = 'analog-output-headphones' ]]; then
	echo "[headphones] setting to speaker..."
	notify-send -r 6322 "setting to speaker..."
	pactl set-sink-port $SINKOUT analog-output-speaker
fi
