#!/bin/bash

$BAR_NAME \
    --add item current_space left \
    --set current_space \
            icon.padding_right=10 \
            icon.color=$COLOR_CURRENT_SPACE_TEXT \
            background.color=$COLOR_CURRENT_SPACE_BG \
            label.drawing=off \
            script="$PLUGIN_SHARED_DIR/current_space.sh" \
    --subscribe current_space space_change mouse.clicked