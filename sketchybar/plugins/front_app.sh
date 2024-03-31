#!/bin/bash

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

PLUGIN_SHARED_DIR="$HOME/.config/sketchybar/plugins"

if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --set $NAME icon="$($PLUGIN_SHARED_DIR/icon_map_fn.sh "$INFO")"
  sketchybar --set $NAME.name label="$INFO"
fi

case "$SENDER" in
"mouse.clicked")
    # Reload sketchybar
    sketchybar --remove '/.*/'
    source $HOME/.config/sketchybar/sketchybarrc
    ;;
esac
