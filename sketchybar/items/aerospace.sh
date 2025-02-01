#!/usr/bin/env bash
POSITION="$1"

$BAR_NAME \
        --add event aerospace_workspace_change \
        --add item workspaces_spacer_1 "$POSITION" \
        --set      workspaces_spacer_1 \
                        width=10 \
                        label.drawing=off

# Fetch workspaces visible on this display/monitor
MONITOR_WORKSPACES=( $(aerospace list-workspaces --monitor $MONITOR_ID) )

for ID in ${MONITOR_WORKSPACES[@]}; do
    $BAR_NAME \
            --add item  workspaces."$ID" "$POSITION" \
            --subscribe workspaces."$ID" aerospace_workspace_change \
            --set       workspaces."$ID" \
                        click_script="aerospace workspace $ID" \
                        icon=$ID \
                        icon.y_offset=1 \
                        label.drawing=off \
                        label.font="sketchybar-app-font:Regular:14.0" \
                        label.y_offset=0 \
                        script="$PLUGIN_SHARED_DIR/aerospace.sh $ID"
done

$BAR_NAME \
        --add item workspaces_spacer_2 "$POSITION" \
        --set      workspaces_spacer_2 \
                        width=20 \
                        label.drawing=off