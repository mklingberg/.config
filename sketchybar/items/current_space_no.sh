#!/bin/bash
source "$CONFIG_DIR/colors.sh" # Loads all defined colors

sketchybar \
    --add item current_space left \
    --set current_space \
            icon.padding_right=10 \
            icon.color=$COLOR_TEXT_CONTRAST \
            background.color=$COLOR_SECONDARY \
            label.drawing=off \
            script="$PLUGIN_SHARED_DIR/current_space.sh" \
    --subscribe current_space space_change mouse.clicked