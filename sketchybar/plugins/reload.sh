#!/bin/bash
source "$CONFIG_DIR/colors.sh" # Loads all defined colors

case "$SENDER" in
"mouse.clicked") # | "power_source_change" | "system_woke"
    # Reload sketchybar
    $BAR_NAME --remove '/.*/'
    source $HOME/.config/$BAR_NAME/sketchybarrc
    ;;
"mouse.entered")
    $BAR_NAME --set $NAME \
                    icon.color=$COLOR_ACCENT
    ;;
"mouse.exited")
    $BAR_NAME --set $NAME \
                    icon.color=$COLOR_SECONDARY
    ;;
esac