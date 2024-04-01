#!/bin/bash

SPACE_SIDS=(1 2 3 4 5 6 7 8 9 10)

for sid in "${SPACE_SIDS[@]}"
do
  $BAR_NAME --add space space.$sid left                                 \
             --set space.$sid space=$sid                                 \
                              icon=$sid                                  \
                              icon.padding_right=10                     \
                              label.font="sketchybar-app-font:Regular:15.0" \
                              label.padding_left=0                     \
                              label.y_offset=-1                          \
                              script="$PLUGIN_SHARED_DIR/space.sh"
done

$BAR_NAME --add item space_separator left                             \
           --set space_separator \
                                 label.drawing=off                     \
                                 icon.drawing=off                     \
                                 script="$PLUGIN_SHARED_DIR/space_windows.sh" \
           --subscribe space_separator space_windows_change             