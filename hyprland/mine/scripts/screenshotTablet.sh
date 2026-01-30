#!/bin/bash

# get using kdeconnect-cli -l
KDECONNECTID="ea696f9cea9c4e23944d659e21c5739f"

DIR="/tmp"
FILENAME=$(uuidgen)

IMGPATH="$DIR/$FILENAME.png"

# take a screenshot
flameshot gui -p "$IMGPATH"

# send it
echo $IMGPATH
kdeconnect-cli --share "$IMGPATH" -d "$KDECONNECTID"

# unlucky no cleanup
