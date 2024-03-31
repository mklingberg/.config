#!/bin/bash
source "$CONFIG_DIR/colors.sh" # Loads all defined colors

sketchybar \
    --add item front_app left \
    --set front_app \
            background.color=$COLOR_ACCENT \
            background.padding_left=0 \
            background.padding_right=0 \
            icon.font="sketchybar-app-font:Regular:$FRONT_APP_ICON_SIZE.0" \
            icon.padding_right=10 \
            icon.padding_left=10 \
            icon.y_offset=0 \
            label.drawing=no \
            script="$PLUGIN_SHARED_DIR/front_app.sh"