#!/bin/bash
source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors

WARNING_THRESHOLD=80

# Get the total number of CPU cores
CORE_COUNT=$(sysctl -n machdep.cpu.thread_count)

# Get the CPU usage from the top command
CPU_USAGE=$(top -l 1 -n 0 | grep "CPU usage" | awk '{print $3 + $5}')

# Calculate the CPU percentage
CPU_PERCENT=$(echo "$CPU_USAGE" | awk '{printf "%.0f\n", $1}')

# Determine the color based on CPU usage
if [ $CPU_PERCENT -gt $WARNING_THRESHOLD ]; then
	ICON_COLOR=$COLOR_WARNING  # Red color in hex
else
	ICON_COLOR=$COLOR_STATS  # Default color
fi

# Update the bar with the CPU percentage and icon color
$BAR_NAME --set $NAME label="$CPU_PERCENT%" label.color=$ICON_COLOR icon.color=$ICON_COLOR