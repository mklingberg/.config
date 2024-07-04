#!/bin/bash

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/sketchybar/config/components#space----associate-mission-control-spaces-with-an-item
source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors

if [ $SELECTED = true ]; then
  $BAR_NAME \
            --set $NAME background.drawing=on \
                         background.color=$COLOR_SPACE_SELECTED_BG \
                         label.color=$COLOR_SPACE_SELECTED_ICON \
                         icon.color=$COLOR_SPACE_SELECTED_SPACE_NO \
                         icon.padding_left=10 \
                         icon.padding_right=5 \
                         label.padding_right=30 \
                         label.drawing=on
else
  $BAR_NAME \
            --set $NAME background.drawing=on \
                         label.color=$COLOR_SPACE_ICON \
                         icon.color=$COLOR_SPACE_SPACE_NO \
                         background.color=$TRANSPARENT \
                         icon.padding_left=10 \
                         icon.padding_right=5 \
                         label.padding_right=30 \
                         label.drawing=on
fi
