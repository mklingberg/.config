#!/bin/bash

sketchybar \
    --add item volume e \
    --set volume \
            icon.padding_left=10 \
            label.padding_right=10 \
            label.drawing=true \
            script="$PLUGIN_SHARED_DIR/volume.sh" \
    --subscribe volume volume_change