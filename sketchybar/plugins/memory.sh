#!/bin/bash

# memory.sh
# Get the memory usage information
MEMORY_INFO=$(vm_stat)

# Extract the active and wired memory in pages
ACTIVE_MEMORY=$(echo "$MEMORY_INFO" | awk '/Pages active:/ {print $3}' | sed 's/\.//')
WIRED_MEMORY=$(echo "$MEMORY_INFO" | awk '/Pages wired down:/ {print $3}' | sed 's/\.//')

# Get the total memory in MB
TOTAL_MEMORY=$(sysctl -n hw.memsize)
TOTAL_MEMORY_MB=$((TOTAL_MEMORY / 1024 / 1024))
TOTAL_MEMORY_GB=$((TOTAL_MEMORY / 1024 / 1024 / 1024))

# Convert pages to MB (assuming 4K pages)
ACTIVE_MEMORY_MB=$((ACTIVE_MEMORY / 256))
WIRED_MEMORY_MB=$((WIRED_MEMORY / 256))

# Calculate the used memory and its percentage
USED_MEMORY_MB=$((ACTIVE_MEMORY_MB + WIRED_MEMORY_MB))
USED_MEMORY_GB=$((USED_MEMORY_MB / 1024))
USED_MEMORY_PERCENT=$((USED_MEMORY_MB * 100 / TOTAL_MEMORY_MB))

sketchybar --set $NAME label="$USED_MEMORY_PERCENT%"
#sketchybar --set $NAME label="$USED_MEMORY_GB GB ($USED_MEMORY_PERCENT%)"