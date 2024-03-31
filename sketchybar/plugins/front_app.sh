#!/bin/bash

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/$BAR_NAME/config/events#events-and-scripting

PLUGIN_SHARED_DIR="$HOME/.config/$BAR_NAME/plugins"

if [ "$SENDER" = "front_app_switched" ]; then
  $BAR_NAME --set $NAME icon="$($PLUGIN_SHARED_DIR/icon_map_fn.sh "$INFO")"
  $BAR_NAME --set $NAME.name label="$INFO"
fi

case "$SENDER" in
"mouse.clicked")
    # Reload $BAR_NAME
    $BAR_NAME --remove '/.*/'
    source $HOME/.config/$BAR_NAME/sketchybarrc
    ;;
esac
