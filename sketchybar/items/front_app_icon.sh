#!/bin/bash

COLOR_FRONT_APP_ICON=0xffc7c7c7

source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors

$BAR_NAME \
    --add item front_app left \
    --set front_app \
            background.color=$COLOR_FRONT_APP_BG \
            background.padding_left=0 \
            background.padding_right=0 \
            icon.font="sketchybar-app-font:Regular:$FRONT_APP_ICON_SIZE.0" \
            icon.padding_right=10 \
            icon.padding_left=0 \
            icon.y_offset=0 \
            label.drawing=no \
            script="$PLUGIN_SHARED_DIR/front_app.sh"