#!/bin/bash

get_display_type() {
    local CURRENT_DISPLAY_NUMBER=$1
    DISPLAY_INFO=$(system_profiler SPDisplaysDataType)
    DISPLAY_COUNT=$(echo "$DISPLAY_INFO" | grep -c 'Resolution') 
    DISPLAY_INDEX_INTERNAL=$(echo "$DISPLAY_INFO" | awk '
    BEGIN { display_index = 0; in_display_block = 0 }
    {
        if ($1 == "") {
            in_display_block = 0
        }
        if ($1 != "" && $2 == "" && $3 == "") {
            in_display_block = 1
            display_index++
        }
        if (in_display_block && $0 ~ /Connection Type: Internal/) {
            print display_index
            exit
        }
    }')

    if [[ $DISPLAY_COUNT -eq 3 && $DISPLAY_INDEX_INTERNAL != "" ]] ; then
         # With 3 displays, the internal display seems to get index 2 with system profiler but 3 with sketchybar?!
        DISPLAY_INDEX_INTERNAL=$((DISPLAY_INDEX_INTERNAL + 1))
    fi

    if [[ $CURRENT_DISPLAY_NUMBER -eq $DISPLAY_INDEX_INTERNAL ]]; then
        echo "Built-in"
    else
        echo "External"
    fi
}
