#!/bin/bash
MONITOR_ID=$1

source "$HOME/.config/sketchybar/plugins/icon_map_fn.sh"

function update_workspace_windows() {
    WORKSPACE_ID=$1
    WINDOWS=$2

    APPS=$(echo "$WINDOWS" | awk -v monitor="$MONITOR_ID" -F'|' '$1 == monitor {print $2 "|" $3}')
    ICON_STRIP=""

    while IFS='|' read -r ID APP_NAME;
    do
        if [ -n "$APP_NAME" ]; then
            ICON_STRIP+=" $(icon_map "$APP_NAME")"
        fi
    done <<< "${APPS}"

    if [ -n "$ICON_STRIP" ]; then
        $BAR_NAME \
            --set workspaces.$WORKSPACE_ID.windows \
                label=" $ICON_STRIP"
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

function refresh_monitor_windows() {
    for ID in $(aerospace list-workspaces --monitor "$MONITOR_ID"); do
        WINDOWS=$(aerospace list-windows --workspace "$ID" --format "%{monitor-id}|%{workspace}|%{app-name}")
        update_workspace_windows "$ID" "$WINDOWS"
    done
}

function init_focused() {
    $BAR_NAME --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$(aerospace list-workspaces --monitor "$MONITOR_ID" --visible) FOCUSED_MONITOR=$(aerospace list-monitors --focused --format "%{monitor-id}" | xargs)
}

if [ "$SENDER" = "aerospace_window_moved" ]; then
    echo "Window moved"
    # As we dont know where the window was moved, we refresh all workspaces
    refresh_monitor_windows
fi

if [ "$SENDER" = "space_windows_change" ]; then
    echo "Window created or destroyed"
    # As we dont know where the window was creaded or destroyed, we refresh all workspaces
    refresh_monitor_windows
fi

if [ "$SENDER" = "aerospace_workspace_change" ]; then
    if [ -n "$FOCUSED_WORKSPACE" ]; then
        update_workspace_windows "$FOCUSED_WORKSPACE" "$FOCUSED_WORKSPACE_WINDOWS"
    fi

    if [ -n "$PREV_WORKSPACE" ]; then
        update_workspace_windows "$PREV_WORKSPACE" "$PREV_WORKSPACE_WINDOWS"
    fi
fi
