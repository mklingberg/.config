#!/bin/bash

$BAR_NAME \
    --add item current_space left \
    --set current_space \
            icon.padding_right=10 \
            icon.color=$COLOR_SPACE_SPACE_NO \
            background.color=$COLOR_SPACE_BG \
            label.drawing=off \
            script="$PLUGIN_SHARED_DIR/current_space.sh" \
    --subscribe current_space space_change mouse.clicked