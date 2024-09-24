#!/bin/bash
source "$HOME/.config/sketchybar/icons.sh"

# airpods.sh
# Fetch the left and right battery status of connected AirPods and update the bar label with the lowest value

# Fetch AirPods battery levels
AIRPODS_INFO=$(system_profiler SPBluetoothDataType | grep -A 20 "AirPods")

CASE_BATTERY=$(echo "$AIRPODS_INFO" | grep "Case Battery Level" | awk '{print $4}' | sed 's/%//' | tr -d '[:space:]')

# Check if the extracted values are empty and set them to 0 if they are
CASE_BATTERY=${CASE_BATTERY:-0}

# Check if we have a value for case battery, but not airpods then show it
if [ "$CASE_BATTERY" -gt 0 ]; then
    $BAR_NAME --set $NAME drawing=on label="$CASE_BATTERY%" icon=$ICON_AIRPODS_CASE
else
    $BAR_NAME --set $NAME drawing=off
fi