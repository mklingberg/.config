#!/bin/bash
source "$HOME/.config/sketchybar/icons.sh"

# airpods.sh
# Fetch the left and right battery status of connected AirPods and update the bar label with the lowest value

# Fetch AirPods battery levels
AIRPODS_INFO=$(system_profiler SPBluetoothDataType | grep -A 20 "AirPods")

# Extract left and right battery levels
LEFT_BATTERY=$(echo "$AIRPODS_INFO" | grep "Left Battery Level" | awk '{print $4}' | sed 's/%//' | tr -d '[:space:]')
RIGHT_BATTERY=$(echo "$AIRPODS_INFO" | grep "Right Battery Level" | awk '{print $4}' | sed 's/%//' | tr -d '[:space:]')
CASE_BATTERY=$(echo "$AIRPODS_INFO" | grep "Case Battery Level" | awk '{print $4}' | sed 's/%//' | tr -d '[:space:]')

# Check if the extracted values are empty and set them to 0 if they are
LEFT_BATTERY=${LEFT_BATTERY:-0}
RIGHT_BATTERY=${RIGHT_BATTERY:-0}
CASE_BATTERY=${CASE_BATTERY:-0}

# Determine the lowest battery level
LOWEST_BATTERY=$(( LEFT_BATTERY < RIGHT_BATTERY ? LEFT_BATTERY : RIGHT_BATTERY ))

# Check if we have a value for case battery, then show it
if [ "$CASE_BATTERY" -gt 0 ]; then
    $BAR_NAME --set $NAME drawing=on label="$CASE_BATTERY%" icon=$ICON_AIRPODS_CASE
# Check if LOWEST_BATTERY is empty (AirPods not connected)
elif [ "$LOWEST_BATTERY" -eq 0 ]; then
    # Hide the item if LOWEST_BATTERY is empty
    $BAR_NAME --set $NAME drawing=off
else
    # Show the item and set the label if LOWEST_BATTERY is not empty
    $BAR_NAME --set $NAME drawing=on label="$LOWEST_BATTERY%" icon=$ICON_AIRPODS
fi