#!/bin/bash

ACTION=$1

if [ "$ACTION" == "up" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +5%
elif [ "$ACTION" == "down" ]; then
    pactl set-sink-volume  @DEFAULT_SINK@ -5%
elif [ "$ACTION" == "mute" ]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
elif [ "$ACTION" == "status" ]; then

  if [ "$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')" = "yes" ]; then
    echo "$(pamixer --get-volume) % [muted]"
  else
    echo "$(pamixer --get-volume) %"
  fi

fi
