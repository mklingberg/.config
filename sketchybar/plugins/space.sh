#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/$BAR_NAME/config/components#space----associate-mission-control-spaces-with-an-item

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

if [ $SELECTED = true ]; then
  $BAR_NAME --set $NAME background.drawing=on \
                         background.color=$COLOR_ACCENT \
                         label.color=$COLOR_BLACK \
                         icon.color=$COLOR_BLACK
else
  $BAR_NAME --set $NAME background.drawing=on \
                         label.color=$COLOR_ACCENT \
                         icon.color=$COLOR_TEXT_CONTRAST \
                         background.color=$COLOR_SECONDARY
fi