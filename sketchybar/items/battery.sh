#!/bin/bash

$BAR_NAME \
    --add item battery q \
    --set battery \
        update_freq=20 \
        icon.padding_left=10 \
        label.padding_right=10 \
        script="$PLUGIN_SHARED_DIR/battery.sh"
