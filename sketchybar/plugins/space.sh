#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/sketchybar/config/components#space----associate-mission-control-spaces-with-an-item
source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors

if [ $SELECTED = true ]; then
  $BAR_NAME --set $NAME background.drawing=on \
                         background.color=$COLOR_TEXT_CONTRAST \
                         label.color=$COLOR_BLACK \
                         icon.color=$COLOR_BLACK \
                         icon.padding_left=30 \
                         label.padding_right=40
else
  $BAR_NAME --set $NAME background.drawing=on \
                         label.color=$COLOR_TEXT_CONTRAST \
                         icon.color=$COLOR_ACCENT \
                         background.color=$COLOR_SECONDARY \
                         icon.padding_left=20 \
                         label.padding_right=40
fi