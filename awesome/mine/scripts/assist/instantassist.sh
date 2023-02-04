#!/bin/bash

LOCATION="/home/$USER/.dothub/awesome/mine/scripts/assist"

ASSIST=$(ls $LOCATION/assists | sed 's/.sh//' | rofi -dmenu -auto-select -theme ~/.config/rofi/assist.rasi | grep -o '^.')

[ -z "$ASSIST" ] && exit # if nothing selected

if [ -d $LOCATION/assists/"$ASSIST" ]; then
    ASSIST2="$(ls $LOCATION/assists/$ASSIST | sed 's/.sh//' | rofi -dmenu -auto-select -theme ~/.config/rofi/assist.rasi | grep -o '^.')"
    [ -z "$ASSIST2" ] && exit
    SCRIPTPATH=$LOCATION/assists/"$ASSIST/$ASSIST2"
else
    if ! [ -e $LOCATION/assists/"$PAPERAPP" ]; then
        echo "assist not found"
        exit
    fi
    SCRIPTPATH=$LOCATION/assists/"$ASSIST"
fi

"${SCRIPTPATH}.sh" &
