#!/bin/bash

sketchybar \
    --add item memory q \
    --set memory \
            icon=  \
            icon.padding_left=10 \
            label.padding_right=10 \
            update_freq=10 \
            script="$PLUGIN_SHARED_DIR/memory.sh"