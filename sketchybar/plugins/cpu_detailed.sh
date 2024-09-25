#!/bin/bash
COLOR_CPU_LOW=0xffee99a0
COLOR_CPU_MEDIUM=0xffed8796
COLOR_CPU_HIGH=0xffff0000

source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors

# Init default values
MEDIUM_THRESHOLD=60
HIGH_THRESHOLD=80
LABEL_THRESHOLD=40
SHOW_LABEL=false

# Get the total number of CPU cores
CORE_COUNT=$(sysctl -n machdep.cpu.thread_count)

# Get the CPU usage from the top command
CPU_USAGE=$(top -l 1 -n 0 | grep "CPU usage")

# Extract user and system CPU percentages
USER_CPU=$(echo "$CPU_USAGE" | awk -F'[:,%]' '{print $2}' | xargs)
SYS_CPU=$(echo "$CPU_USAGE" | awk -F'[:,%]' '{print $4}' | xargs)

# Round the values to zero decimals
USER_CPU=$(printf "%.0f" "$USER_CPU")
SYS_CPU=$(printf "%.0f" "$SYS_CPU")

# Determine the color based on CPU usage
if [ $USER_CPU -gt $HIGH_THRESHOLD ] || [ $SYS_CPU -gt $HIGH_THRESHOLD ]; then
    ICON_COLOR=$COLOR_CPU_HIGH
elif [ $USER_CPU -gt $MEDIUM_THRESHOLD ] || [ $SYS_CPU -gt $MEDIUM_THRESHOLD ]; then
    ICON_COLOR=$COLOR_CPU_MEDIUM
else
    ICON_COLOR=$COLOR_CPU_LOW  # Default color
fi

# Check if the label should be shown
if [ $USER_CPU -gt $LABEL_THRESHOLD ] || [ $SYS_CPU -gt $LABEL_THRESHOLD ]; then
    SHOW_LABEL=true
fi

# Format the label
# if [ $USER_CPU -gt $SYS_CPU ]; then
#     LABEL="${USER_CPU}%"
# else
#     LABEL="[${SYS_CPU}%]"
# fi

LABEL="${USER_CPU}/${SYS_CPU}%"

# Update the bar with the CPU percentage and icon color
$BAR_NAME --set $NAME label="$LABEL" drawing=$SHOW_LABEL label.color=$ICON_COLOR icon.color=$ICON_COLOR