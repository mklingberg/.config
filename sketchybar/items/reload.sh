#!/bin/bash
COLOR_RELOAD_ICON=0xffc7c7c7
COLOR_RELOAD_BG=0xff21222c

source "$HOME/.config/$BAR_NAME/theme.sh"

$BAR_NAME \
    --add item reload left \
    --set reload \
            icon=󰑓 \
            icon.color=$COLOR_RELOAD_ICON \
            icon.padding_left=5 \
            icon.padding_right=5 \
            background.color=$COLOR_RELOAD_BG \
            label.padding_right=0 \
            label.padding_right=0 \
            script="$PLUGIN_SHARED_DIR/reload.sh" \
    --subscribe reload mouse.clicked mouse.entered mouse.exited
