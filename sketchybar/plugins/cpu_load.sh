#!/bin/bash
COLOR_CPU_LOW=0xffee99a0
COLOR_CPU_MEDIUM=0xffed8796
COLOR_CPU_HIGH=0xffff0000

source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors

# Init default values
MEDIUM_THRESHOLD=6.0
HIGH_THRESHOLD=10.0

# Get the total number of CPU cores
CORE_COUNT=$(sysctl -n machdep.cpu.thread_count)

# Extract Load Avg values 
LOAD_AVG=$(top -l 1 -n 0 | grep "Load Avg" | awk -F'[:,]' '{print $2}' | xargs)

# Determine the color based on CPU usage
if (( $(echo "$LOAD_AVG > $HIGH_THRESHOLD" | bc -l) )); then
    ICON_COLOR=$COLOR_CPU_HIGH
elif (( $(echo "$LOAD_AVG > $MEDIUM_THRESHOLD" | bc -l) )); then
    ICON_COLOR=$COLOR_CPU_MEDIUM
else
    ICON_COLOR=$COLOR_CPU_LOW  # Default color
fi

# Update the bar with the CPU percentage and icon color
$BAR_NAME --set $NAME icon.color=$ICON_COLOR