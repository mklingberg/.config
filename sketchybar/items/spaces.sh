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
source "$CONFIG_DIR/colors.sh" # Loads all defined colors

SPACE_SIDS=(1 2 3 4 5) # 6 7 8 9 10

for sid in "${SPACE_SIDS[@]}"
do
  $BAR_NAME \
     --add space space.$sid left \
     --set space.$sid \
            space=$sid \
            icon=$sid \
            icon.padding_right=0 \
            label.font="sketchybar-app-font:Regular:16.0" \
            label.padding_left=0 \
            label.y_offset=-1 \
            script="$PLUGIN_SHARED_DIR/space.sh" \
     --subscribe space.$sid space_change mouse.clicked
done

$BAR_NAME --add item space_separator left \
          --set space_separator \
                label.drawing=off \
                icon.drawing=off \
                script="$PLUGIN_SHARED_DIR/space_windows.sh" \
          --subscribe space_separator space_windows_change

$BAR_NAME \
    --add bracket spaces_bracket \
              space.1 \
              space.2 \
              space.3 \
              space.4 \
              space.5 \
              space.6 \
              space.7 \
              space.8 \
              space.9 \
       --set spaces_bracket \
              background.color=$COLOR_SPACE_BG \
              background.padding_left=0 \
              background.padding_right=0
              