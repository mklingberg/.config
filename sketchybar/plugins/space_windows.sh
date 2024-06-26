#!/bin/bash

if [ "$SENDER" = "space_windows_change" ]; then #|| [ "$SENDER" = "front_app_switched" ]
  space="$(echo "$INFO" | jq -r '.space')"
  apps="$(echo "$INFO" | jq -r '.apps | keys[]')"

  icon_strip=" "
  if [ "${apps}" != "" ]; then
    while read -r app
    do
      icon_strip+=" $($HOME/.config/sketchybar/plugins/icon_map_fn.sh "$app")"      
    done <<< "${apps}"
  else
    icon_strip=" —"
  fi

  $BAR_NAME --set space.$space label="$icon_strip"
fi