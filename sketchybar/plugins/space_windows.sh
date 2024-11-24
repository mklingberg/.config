#!/bin/bash

if [ "$SENDER" = "space_windows_change" ]; then #|| [ "$SENDER" = "front_app_switched" ]
  SPACE="$(echo "$INFO" | jq -r '.space')"
  APPS="$(echo "$INFO" | jq -r '.apps | keys[]')"

  ICON_STRIP=" "
  if [ "${APPS}" != "" ]; then
    while read -r app
    do
      ICON_STRIP+=" $($HOME/.config/sketchybar/plugins/icon_map_fn.sh "$app")"      
    done <<< "${APPS}"
      
    $BAR_NAME --set space.$SPACE \
        label="$ICON_STRIP"
  else
    $BAR_NAME --set space.$SPACE \
        label=" —"
  fi
      
fi