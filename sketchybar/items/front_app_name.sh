#!/bin/bash

COLOR_FRONT_APP_NAME=0xffcad3f5
COLOR_FRONT_APP_NAME_BG=0xff2e3440

source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors

$BAR_NAME \
    --add item front_app.name center \
    --set front_app.name \
            icon.drawing=off \
            label.font="$FONT_FACE:Bold:$FRONT_APP_NAME_SIZE.0" \
            label.color=$COLOR_FRONT_APP_NAME \
            background.color=$COLOR_FRONT_APP_BG \
            label.padding_left=5 \
            label.padding_right=0