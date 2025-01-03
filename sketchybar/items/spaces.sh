#!/bin/bash

COLOR_SPACE_SELECTED_BG=0xffc7c7c7
COLOR_SPACE_SELECTED_SPACE_NO=0xff000000
COLOR_SPACE_SELECTED_ICON=0xff000000

COLOR_SPACE_BG=0xff24273a
COLOR_SPACE_SPACE_NO=0xffc7c7c7
COLOR_SPACE_ICON=0xffc7c7c7

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/sketchybar/config/components#space----associate-mission-control-spaces-with-an-item
source "$HOME/.config/$BAR_NAME/theme.sh"

SPACE_SIDS=(0 1 2 3 4 5 6 7 8 9 10)

for sid in "${SPACE_SIDS[@]}"
do
  $BAR_NAME \
     --add space space.$sid center \
     --set space.$sid \
            space=$sid \
            icon=$sid \
            icon.y_offset=1 \
            label.font="sketchybar-app-font:Regular:14.0" \
            label.y_offset=0 \
            script="$PLUGIN_SHARED_DIR/space.sh" \
     --subscribe space.$sid space_change mouse.clicked
done

$BAR_NAME --add item space_separator center \
          --set space_separator \
                label.drawing=off \
                icon.drawing=off \
                script="$PLUGIN_SHARED_DIR/space_windows.sh" \
          --subscribe space_separator space_windows_change
              
