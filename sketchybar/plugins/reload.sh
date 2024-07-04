#!/bin/bash


#
COLOR_RELOAD_ENTERED=0xffa6da95
COLOR_RELOAD_EXITED=0xfff5a97f

source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors

case "$SENDER" in
"mouse.clicked") # | "power_source_change" | "system_woke"
    # Reload sketchybar
    $BAR_NAME --remove '/.*/'
    source $HOME/.config/$BAR_NAME/sketchybarrc
    ;;
"mouse.entered")
    $BAR_NAME --set $NAME \
                    icon.color=$COLOR_RELOAD_ENTERED
    ;;
"mouse.exited")
    $BAR_NAME --set $NAME \
                    icon.color=$COLOR_RELOAD_EXITED
    ;;
esac