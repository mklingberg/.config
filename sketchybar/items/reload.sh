#!/bin/bash
source "$CONFIG_DIR/colors.sh" # Loads all defined colors

$BAR_NAME \
    --add item reload left \
    --set reload \
            icon=󰑓 \
            icon.color=$COLOR_SECONDARY \
            icon.padding_left=5 \
            icon.padding_right=5 \
            background.color=$COLOR_SECONDARY \
            label.padding_right=0 \
            label.padding_right=0 \
            script="$PLUGIN_SHARED_DIR/reload.sh" \
    --subscribe reload mouse.clicked mouse.entered mouse.exited
