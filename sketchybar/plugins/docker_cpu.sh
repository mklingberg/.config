#!/bin/bash

LABEL_THRESHOLD=10
SHOW_LABEL=false

# docker_cpu.sh
# Get the CPU usage percentage across all Docker containers

# Get the docker stats for all containers
DOCKER_STATS_CPU=$(docker stats --no-stream --format "{{.CPUPerc}}")

# Check if DOCKER_STATS_CPU is empty
if [ $DOCKER_STATS_CPU = "" ]; then
# Hide the item if no stats are returned, then docker isnt running
    $BAR_NAME --set $NAME drawing=false
    exit 0
fi

# Initialize total CPU usage percentage
TOTAL_CPU_PERCENT=0

# Sum up the CPU usage percentages
while read -r CPU_PERCENT; do
    # Remove the '%' sign and convert to float
    CPU_PERCENT=${CPU_PERCENT%\%}
    TOTAL_CPU_PERCENT=$(echo "$TOTAL_CPU_PERCENT + $CPU_PERCENT" | bc)
done <<< "$DOCKER_STATS_CPU"

# Round up the total CPU usage percentage to the nearest integer
TOTAL_CPU_PERCENT=$(echo "$TOTAL_CPU_PERCENT" | awk '{print int($1+0.999)}')

if [ $TOTAL_CPU_PERCENT -gt $LABEL_THRESHOLD ]; then
  SHOW_LABEL=true
fi

# Set the CPU usage percentage in SketchyBar
$BAR_NAME --set $NAME drawing=true label.drawing=$SHOW_LABEL label="${TOTAL_CPU_PERCENT}%"