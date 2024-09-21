#!/bin/bash

# airpods.sh
# Fetch the left and right battery status of connected AirPods and update the bar label with the lowest value

# Fetch AirPods battery levels
AIRPODS_INFO=$(system_profiler SPBluetoothDataType | grep -A 20 "AirPods")

# Extract left and right battery levels
LEFT_BATTERY=$(echo "$AIRPODS_INFO" | grep "Left Battery Level" | awk '{print $4}' | sed 's/%//' | tr -d '[:space:]')
RIGHT_BATTERY=$(echo "$AIRPODS_INFO" | grep "Right Battery Level" | awk '{print $4}' | sed 's/%//' | tr -d '[:space:]')

# Check if the extracted values are empty and set them to 0 if they are
LEFT_BATTERY=${LEFT_BATTERY:-0}
RIGHT_BATTERY=${RIGHT_BATTERY:-0}

# Determine the lowest battery level
LOWEST_BATTERY=$(( LEFT_BATTERY < RIGHT_BATTERY ? LEFT_BATTERY : RIGHT_BATTERY ))

# Check if LOWEST_BATTERY is empty (AirPods not connected)
if [ "$LOWEST_BATTERY" -eq 0 ]; then
    # Hide the item if LOWEST_BATTERY is empty
    $BAR_NAME --set $NAME drawing=off
else
    # Show the item and set the label if LOWEST_BATTERY is not empty
    $BAR_NAME --set $NAME drawing=on label="$LOWEST_BATTERY%"
fi