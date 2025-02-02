#!/bin/bash
MONITOR_ID=$1

source "$HOME/.config/sketchybar/plugins/icon_map_fn.sh"

function update_workspace_windows() {
    WORKSPACE_ID=$1
    WINDOWS=$2

    APPS=$(echo "$WINDOWS" | awk -v monitor="$MONITOR_ID" -F'|' '$1 == monitor {print $2 "|" $3}')
    ICON_STRIP=" "

    if [ -n "$APPS" ]; then
        while IFS='|' read -r ID APP_NAME;
        do
            ICON_STRIP+=" $(icon_map "$APP_NAME")"
        done <<< "${APPS}"

        $BAR_NAME \
            --set workspaces.$WORKSPACE_ID.windows \
            label="$ICON_STRIP"
    else
        $BAR_NAME \
        --set workspaces.$WORKSPACE_ID.windows \
            label=" —"
    fi 
}

function init_workspace_windows() {
    for ID in $(aerospace list-workspaces --monitor "$MONITOR_ID" --empty no); do
        WINDOWS=$(aerospace list-windows --workspace "$ID" --format "%{monitor-id}|%{workspace}|%{app-name}")
        update_workspace_windows "$ID" "$WINDOWS"
    done

    init_focused
}

function init_focused() {
    $BAR_NAME --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused) FOCUSED_MONITOR=$(aerospace list-monitors --focused --format "%{monitor-id}" | xargs)
}

if [ "$SENDER" = "aerospace_workspace_change" ]; then
    echo "Processing change event $FOCUSED_WORKSPACE"
    if [ -n "$FOCUSED_WORKSPACE_WINDOWS" ]; then
        update_workspace_windows "$FOCUSED_WORKSPACE" "$FOCUSED_WORKSPACE_WINDOWS"
    fi

    if [ -n "$PREV_WORKSPACE_WINDOWS" ]; then
        update_workspace_windows "$PREV_WORKSPACE" "$PREV_WORKSPACE_WINDOWS"
    fi
fi
