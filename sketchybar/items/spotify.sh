#!/bin/bash

sketchybar \
    --add event spotify_change $SPOTIFY_EVENT \
    --add item spotify right \
    --set spotify \
            icon= \
            icon.y_offset=0 \
            icon.padding_left=10 \
            icon.padding_right=10 \
            label.padding_right=10 \
            label.drawing=off \
            label.padding_left=3 \
            background.color=$COLOR_ACCENT \
            script="$PLUGIN_DIR/spotify.sh" \
    --subscribe spotify spotify_change mouse.clicked