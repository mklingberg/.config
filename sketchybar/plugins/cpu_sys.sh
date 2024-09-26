#!/bin/bash
COLOR_CPU_LOW=0xffee99a0
COLOR_CPU_MEDIUM=0xffed8796
COLOR_CPU_HIGH=0xffff0000

source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors

# Init default values
LOAD_THRESHOLD=6.0

MEDIUM_THRESHOLD=60
HIGH_THRESHOLD=80

SHOW_LABEL=false

# Get the total number of CPU cores
CORE_COUNT=$(sysctl -n machdep.cpu.thread_count)

# Extract Load Avg values 
LOAD_AVG=$(top -l 1 -n 0 | grep "Load Avg" | awk -F'[:,]' '{print $2}' | xargs)

# Check if the 1-minute load average is above the threshold
if (( $(echo "$LOAD_AVG > $LOAD_THRESHOLD" | bc -l) )); then
    SHOW_LABEL=true

    # Extract user and system CPU percentages
    SYS_CPU=$(echo "$CORE_COUNT" | top -l 1 -n 0 | grep "CPU usage" | awk -F'[:,%]' '{print $4}' | xargs)

    # Set locale to C for correct number interpretation
    export LC_NUMERIC=C

    # Round the values to zero decimals
    SYS_CPU=$(printf "%.0f" "$SYS_CPU")

    # Determine the color based on CPU usage
    if [ $SYS_CPU -gt $HIGH_THRESHOLD ]; then
        ICON_COLOR=$COLOR_CPU_HIGH
    elif [ $SYS_CPU -gt $MEDIUM_THRESHOLD ]; then
        ICON_COLOR=$COLOR_CPU_MEDIUM
    else
        ICON_COLOR=$COLOR_CPU_LOW  # Default color
    fi

    # Format the label
    LABEL="${SYS_CPU}%"
fi

# Update the bar with the CPU percentage and icon color
$BAR_NAME --set $NAME label="$LABEL" drawing=$SHOW_LABEL label.color=$ICON_COLOR icon.color=$ICON_COLOR