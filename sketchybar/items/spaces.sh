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
    --add item space.$sid.s left \
    --set space.$sid.s \
            icon= \
            icon.color=$COLOR_SPACE_BG \
            background.color=$COLOR_SPACE_BG \
            icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0" \
            icon.padding_left=0 \
            icon.padding_right=-8 \
            icon.y_offset=1  \
     --add space space.$sid left \
     --set space.$sid \
            space=$sid \
            icon=$sid \
            icon.padding_right=0 \
            label.font="sketchybar-app-font:Regular:16.0" \
            label.padding_left=0 \
            label.y_offset=-1 \
            script="$PLUGIN_SHARED_DIR/space.sh" \
     --subscribe space.$sid space_change mouse.clicked \
     --add item space.$sid.e left \
     --set space.$sid.e \
            icon= \
            icon.color=$COLOR_SPACE_BG \
            background.color=$TRANSPARENT \
            icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0" \
            icon.padding_left=0 \
            icon.padding_right=0 \
            icon.y_offset=1
done

$BAR_NAME --add item space_separator left \
          --set space_separator \
                label.drawing=off \
                icon.drawing=off \
                script="$PLUGIN_SHARED_DIR/space_windows.sh" \
          --subscribe space_separator space_windows_change

$BAR_NAME \
    --add bracket spaces_bracket \
              space.1.s \
              space.1 \
              space.1.e \
              space.2.s \
              space.2 \
              space.2.e \
              space.3.s \
              space.3 \
              space.3.e \
              space.4.s \
              space.4 \
              space.4.e \
              space.5.s \
              space.5 \
              space.5.e \
              space.6.s \
              space.6 \
              space.6.e \
              space.7.s \
              space.7 \
              space.7.e \
              space.8.s \
              space.8 \
              space.8.e \
              space.9.s \
              space.9 \
              space.9.e \
       --set spaces_bracket \
              background.color=$COLOR_SPACE_BG \
              background.padding_left=0 \
              background.padding_right=0
              