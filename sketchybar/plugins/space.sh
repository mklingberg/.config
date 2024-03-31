#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

if [ $SELECTED = true ]; then
  sketchybar --set $NAME background.drawing=on \
                         background.color=$COLOR_ACCENT \
                         label.color=$BLACK \
                         icon.color=$BLACK
else
  sketchybar --set $NAME background.drawing=on \
                         label.color=$COLOR_ACCENT \
                         icon.color=$COLOR_TEXT_CONTRAST \
                         background.color=$COLOR_SECONDARY
fi