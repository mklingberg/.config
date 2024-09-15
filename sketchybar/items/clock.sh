#!/bin/bash

$BAR_NAME \
    --add item clock right \
    --set clock \
            label.color=$COLOR_RIGHT_AREA_TEXT \
            background.color=$COLOR_RIGHT_AREA_BG \
            update_freq=10 \
            script="$PLUGIN_SHARED_DIR/clock.sh" \
