#!/bin/bash

SPACE_SIDS=(1 2 3 4 5) # 6 7 8 9 10

for sid in "${SPACE_SIDS[@]}"
do
  $BAR_NAME \
    --add item space.$sid.s left \
    --set space.$sid.s \
            icon= \
            icon.color=$COLOR_SECONDARY \
            background.color=$COLOR_SECONDARY \
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
            icon.color=$COLOR_SECONDARY \
            background.color=$COLOR_SECONDARY \
            icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0" \
            icon.padding_left=0 \
            icon.padding_right=-8 \
            icon.y_offset=1
done

$BAR_NAME --add item space_separator left \
          --set space_separator \
                label.drawing=off \
                icon.drawing=off \
                script="$PLUGIN_SHARED_DIR/space_windows.sh" \
          --subscribe space_separator space_windows_change