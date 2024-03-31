#!/bin/bash
source "$CONFIG_DIR/colors.sh" # Loads all defined colors

sketchybar \
    --add item battery e \
    --set battery \
        update_freq=20 \
        icon.padding_left=10 \
        label.padding_right=10 \
        script="$PLUGIN_SHARED_DIR/battery.sh"
