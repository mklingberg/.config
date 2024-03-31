#!/bin/bash
source "$CONFIG_DIR/colors.sh" # Loads all defined colors

sketchybar \
    --add item clock right \
    --set clock \
            label.color=$COLOR_TEXT_CONTRAST \
            background.color=$COLOR_SECONDARY \
            update_freq=10 \
            script="$PLUGIN_SHARED_DIR/clock.sh" \
