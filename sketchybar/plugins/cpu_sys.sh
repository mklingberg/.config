#!/bin/bash
COLOR_CPU_LOW=0xffee99a0
COLOR_CPU_MEDIUM=0xffed8796
COLOR_CPU_HIGH=0xffff0000

source "$HOME/.config/$BAR_NAME/theme.sh"

# Init default values
LOAD_THRESHOLD=10.0

MEDIUM_THRESHOLD=60
HIGH_THRESHOLD=80

# Refresh rate
UPDATE_FREQ_STANDBY=30
UPDATE_FREQ_HI=5
UPDATE_FREQ=$UPDATE_FREQ_STANDBY

SHOW_LABEL=false

STATS=$(sysctl -n machdep.cpu.thread_count | top -l 1 -n 0)

# Extract Load Avg values 
LOAD_AVG=$(echo "$STATS" | grep "Load Avg" | awk -F'[:,]' '{print $2}' | xargs)

# Check if the 1-minute load average is above the threshold
if (( $(echo "$LOAD_AVG > $LOAD_THRESHOLD" | bc -l) )); then
    SHOW_LABEL=true

    # Extract user and system CPU percentages
    SYS_CPU=$(echo "$STATS" | grep "CPU usage" | awk -F'[:,%]' '{print $4}' | xargs)

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

    UPDATE_FREQ=$UPDATE_FREQ_HI
fi

cpu_sys=(
    label=$LABEL
    drawing=$SHOW_LABEL
    label.color=$ICON_COLOR
    icon.color=$ICON_COLOR
    update_freq=$UPDATE_FREQ
)

# Update the bar with the CPU percentage and icon color
$BAR_NAME --set $NAME "${cpu_sys[@]}" 