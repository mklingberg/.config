#!/bin/bash
MONITOR_ID=$1

source "$HOME/.config/sketchybar/plugins/icon_map_fn.sh"

function update_workspace() {
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
            --set workspaces.$WORKSPACE_ID \
            label="$ICON_STRIP"
    else
        $BAR_NAME \
        --set workspaces.$WORKSPACE_ID \
            label=" —"
    fi 
}

function init_workspaces() {
    for ID in $(aerospace list-workspaces --monitor "$MONITOR_ID" --empty no); do
        WINDOWS=$(aerospace list-windows --workspace "$ID" --format "%{monitor-id}|%{workspace}|%{app-name}")
        update_workspace "$ID" "$WINDOWS"
    done
}

function init_focused() {
    $BAR_NAME --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)
}

if [ "$SENDER" = "aerospace_workspace_change" ]; then
    if [ -n "$FOCUSED_WORKSPACE_WINDOWS" ]; then
        update_workspace "$FOCUSED_WORKSPACE" "$FOCUSED_WORKSPACE_WINDOWS"
    fi

    if [ -n "$PREV_WORKSPACE_WINDOWS" ]; then
        update_workspace "$PREV_WORKSPACE" "$PREV_WORKSPACE_WINDOWS"
    fi
fi
