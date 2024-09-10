#!/bin/bash

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/sketchybar/config/components#space----associate-mission-control-spaces-with-an-item
source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors

PADDING_RIGHT=30
PADDING_LEFT=10

if [ $SELECTED = true ]; then
  #background.color=$COLOR_SPACE_SELECTED_BG \
  $BAR_NAME \
            --set $NAME background.drawing=on \
                         label.color=$COLOR_SPACE_SELECTED_ICON \
                         icon.color=$COLOR_SPACE_SELECTED_SPACE_NO \
                         icon.padding_left=$PADDING_LEFT \
                         icon.padding_right=5 \
                         label.padding_right=$PADDING_RIGHT \
                         label.drawing=on
else
  $BAR_NAME \
            --set $NAME background.drawing=on \
                         label.color=$COLOR_SPACE_ICON \
                         icon.color=$COLOR_SPACE_SPACE_NO \
                         background.color=$TRANSPARENT \
                         icon.padding_left=$PADDING_LEFT \
                         icon.padding_right=5 \
                         label.padding_right=$PADDING_RIGHT \
                         label.drawing=on
fi
