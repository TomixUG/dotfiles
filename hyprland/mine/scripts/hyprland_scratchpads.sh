#!/bin/bash

# open the window if it's not opened
if ! hyprctl clients -j | jq -e ".[] | select(.class == \"$1\")" >/dev/null; then
	echo "No window with class '$1' is open, opening..."
	$2 &
	exit
fi

active_workspace_id=$(hyprctl activeworkspace -j | jq -r .id)

if hyprctl clients -j | jq --argjson wsid "$active_workspace_id" --arg class "$1" '.[] | select(.workspace.id == $wsid) | select(.class == $class)' | grep -q .; then
	echo "A window with class '$1' is open in the current workspace."
	hyprctl dispatch "movetoworkspacesilent special:$1,class:($1)"
else
	echo "No window with class '$1' is open in the current workspace."
	hyprctl dispatch "movetoworkspacesilent $(hyprctl activeworkspace -j | jq -r '.id'),class:($1)"
fi
