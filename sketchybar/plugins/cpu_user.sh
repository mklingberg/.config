#!/bin/bash
COLOR_CPU_LOW=0xffee99a0
COLOR_CPU_MEDIUM=0xffed8796
COLOR_CPU_HIGH=0xffff0000

source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors
source "$HOME/.config/sketchybar/icons.sh"

# Init default values
LOAD_THRESHOLD=3.0

MEDIUM_THRESHOLD=60
HIGH_THRESHOLD=80
SHOW_LABEL=false
LABEL=""
ICON=$ICON_CPU_IDLE
COLOR=$COLOR_CPU_LOW

# Get the total number of CPU cores
CORE_COUNT=$(sysctl -n machdep.cpu.thread_count)

# Extract Load Avg values 
LOAD_AVG=$(top -l 1 -n 0 | grep "Load Avg" | awk -F'[:,]' '{print $2}' | xargs)

# Check if the 1-minute load average is above the threshold
if (( $(echo "$LOAD_AVG > $LOAD_THRESHOLD" | bc -l) )); then
    # Extract user and system CPU percentages
    USER_CPU=$(echo "$CORE_COUNT" | top -l 1 -n 0 | grep "CPU usage" | awk -F'[:,%]' '{print $2}' | xargs)

    # Set locale to C for correct number interpretation
    export LC_NUMERIC=C

    # Calculate the CPU percentage
    # Round the values to zero decimals
    USER_CPU=$(printf "%.0f" "$USER_CPU")

    # Determine the color based on CPU usage
    if [ $USER_CPU -gt $HIGH_THRESHOLD ]; then
        COLOR=$COLOR_CPU_HIGH
    elif [ $USER_CPU -gt $MEDIUM_THRESHOLD ]; then
        COLOR=$COLOR_CPU_MEDIUM
    else
        COLOR=$COLOR_CPU_LOW  # Default color
    fi

    SHOW_LABEL=true
    # Format the label
    LABEL="${USER_CPU}%"
    ICON=$ICON_CPU_USER
fi

# Update the bar with the CPU percentage and icon color
$BAR_NAME --set $NAME \
        icon=$ICON \
        label="$LABEL" \
        label.drawing=$SHOW_LABEL \
        label.color=$COLOR \
        icon.color=$COLOR