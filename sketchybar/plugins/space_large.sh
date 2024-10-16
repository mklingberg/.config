#!/bin/bash

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/sketchybar/config/components#space----associate-mission-control-spaces-with-an-item
source "$HOME/.config/$BAR_NAME/theme.sh" # Loads all defined colors

PADDING_RIGHT=10
PADDING_LEFT=10

PADDING_RIGHT_SELECTED=16
PADDING_LEFT_SELECTED=10

if [ $SELECTED = true ]; then
    $BAR_NAME \
        --set $NAME background.drawing=on \
            icon.font="$FONT_FACE:Medium:32.0" \
            label.font="sketchybar-app-font:Regular:18.0" \
            label.color=$COLOR_SPACE_SELECTED_ICON \
            icon.color=$COLOR_SPACE_SELECTED_SPACE_NO \
            icon.padding_left=$PADDING_LEFT_SELECTED \
            icon.padding_right=2 \
            label.padding_right=$PADDING_RIGHT_SELECTED
else
    $BAR_NAME \
        --set $NAME background.drawing=on \
            icon.font="$FONT_FACE:Medium:22.0" \
            label.font="sketchybar-app-font:Regular:16.0" \
            label.color=$COLOR_SPACE_ICON \
            icon.color=$COLOR_SPACE_SPACE_NO \
            background.color=$TRANSPARENT \
            icon.padding_left=$PADDING_LEFT \
            icon.padding_right=2 \
            label.padding_right=$PADDING_RIGHT
fi
