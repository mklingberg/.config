#!/bin/bash

SPACE_SIDS=(1 2 3 4 5 6 7 8 9 10)

for sid in "${SPACE_SIDS[@]}"
do
  sketchybar --add space space.$sid left                                 \
             --set space.$sid space=$sid                                 \
                              icon=$sid                                  \
                              icon.padding_left=20                     \
                              icon.padding_right=10                     \
                              label.font="sketchybar-app-font:Regular:16.0" \
                              label.padding_right=40                     \
                              label.y_offset=-1                          \
                              script="$PLUGIN_SHARED_DIR/space.sh"
done

sketchybar --add item space_separator left                             \
           --set space_separator \
                                 icon.color=$ACCENT_COLOR \
                                 label.drawing=off                     \
                                 icon.drawing=off                     \
                                 icon.color=$COLOR_TEXT_CONTRAST \
                                 script="$PLUGIN_SHARED_DIR/space_windows.sh" \
           --subscribe space_separator space_windows_change             