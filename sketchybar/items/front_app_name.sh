#!/bin/bash

COLOR_FRONT_APP_NAME=0xffcad3f5

source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors

$BAR_NAME \
    --add item front_app.name left \
    --set front_app.name \
            icon.drawing=off \
            label.font="$FONT_FACE:Bold:$FRONT_APP_NAME_SIZE.0" \
            label.color=$COLOR_FRONT_APP_NAME \
            label.padding_left=10