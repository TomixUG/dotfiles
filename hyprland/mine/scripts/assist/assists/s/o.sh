#!/usr/bin/env bash

# assist: "freeze" part of the screen

G=$(slop -f "%g") || exit 1

SCDIR="/tmp/awesome/screenshot/$(whoami)"

mkdir -p "$SCDIR"

PICNAME="$(date "+%s")".png

import -window root -crop "$G" "$SCDIR"/"$PICNAME"

feh --title "amogus screen freeze" --class "screenfreeze" --geometry "$G" "$SCDIR"/"$PICNAME" &
sleep 1

rm "$SCDIR"/"$PICNAME"

