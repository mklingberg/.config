#!/bin/bash

# memory.sh
# Get the memory usage information
MEMORY_INFO=$(vm_stat)

# Extract the memory usage in pages
ACTIVE_MEMORY=$(echo "$MEMORY_INFO" | awk '/Pages active:/ {print $3}' | sed 's/\.//')
WIRED_MEMORY=$(echo "$MEMORY_INFO" | awk '/Pages wired down:/ {print $3}' | sed 's/\.//')
INACTIVE_MEMORY=$(echo "$MEMORY_INFO" | awk '/Pages inactive:/ {print $3}' | sed 's/\.//')
SPECULATIVE_MEMORY=$(echo "$MEMORY_INFO" | awk '/Pages speculative:/ {print $3}' | sed 's/\.//')
COMPRESSED_MEMORY=$(echo "$MEMORY_INFO" | awk '/Pages occupied by compressor:/ {print $3}' | sed 's/\.//')

# Get the total memory in MB
TOTAL_MEMORY=$(sysctl -n hw.memsize)
TOTAL_MEMORY_MB=$((TOTAL_MEMORY / 1024 / 1024))

# Convert pages to MB (assuming 4K pages)
ACTIVE_MEMORY_MB=$((ACTIVE_MEMORY / 256))
WIRED_MEMORY_MB=$((WIRED_MEMORY / 256))
INACTIVE_MEMORY_MB=$((INACTIVE_MEMORY / 256))
SPECULATIVE_MEMORY_MB=$((SPECULATIVE_MEMORY / 256))
COMPRESSED_MEMORY_MB=$((COMPRESSED_MEMORY / 256))

# Calculate the used memory and its percentage
USED_MEMORY_MB=$((ACTIVE_MEMORY_MB + WIRED_MEMORY_MB + INACTIVE_MEMORY_MB + SPECULATIVE_MEMORY_MB + COMPRESSED_MEMORY_MB))
USED_MEMORY_PERCENT=$((USED_MEMORY_MB * 100 / TOTAL_MEMORY_MB))

$BAR_NAME --set $NAME label="$USED_MEMORY_PERCENT%"