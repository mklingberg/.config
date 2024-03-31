#!/bin/bash
source "$CONFIG_DIR/colors.sh" # Loads all defined colors

sketchybar \
    --add item front_app.name left \
    --set front_app.name \
            background.color=0x00000000 \
            icon.drawing=off \
            label.font="$FONT_FACE:Bold:16.0" \
            label.color=0xffcad3f5 \
            label.padding_left=10