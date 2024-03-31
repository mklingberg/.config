#!/bin/bash

STATE="$(echo "$INFO" | jq -r '.state')"
if [ "$STATE" = "playing" ]; then
  MEDIA="$(echo "$INFO" | jq -r '.title + " - " + .artist')"
  $BAR_NAME --set $NAME label="$MEDIA" drawing=on
else
  $BAR_NAME --set $NAME drawing=off
fi