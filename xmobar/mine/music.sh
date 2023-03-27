#!/bin/bash

name=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | awk -F 'string "' '/xesam:title/ { getline; print substr($2, 1, length($2)-1)}')
artist=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | awk -F 'string "' '/xesam:artist/ { getline; getline; print substr($2, 1, length($2)-1)}')

echo "$artist - $name"
