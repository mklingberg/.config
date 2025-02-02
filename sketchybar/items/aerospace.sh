#!/usr/bin/env bash
source "$HOME/.config/$BAR_NAME/theme.sh" # Loads all defined colors

POSITION="$1"

$BAR_NAME \
        --add event aerospace_workspace_change \
        --add item workspaces_spacer_1 "$POSITION" \
        --set      workspaces_spacer_1 \
                        width=1 \
                        label.drawing=off

# Fetch workspaces visible on this display/monitor
MONITOR_WORKSPACES=( $(aerospace list-workspaces --monitor $MONITOR_ID) )

ADD_SPACER=false

for ID in ${MONITOR_WORKSPACES[@]}; do

    if [ "$ADD_SPACER" = true ]; then
        $BAR_NAME \
            --add item  workspace_spacer_"$ID" "$POSITION" \
            --set       workspace_spacer_"$ID" \
                        width=1 \
                        label.drawing=off
    fi
    
    $BAR_NAME \
            --add item  workspaces."$ID" "$POSITION" \
            --set       workspaces."$ID" \
                        click_script="aerospace workspace $ID" \
                        icon="$ID" \
            --add item  workspaces."$ID".windows "$POSITION" \
            --subscribe workspaces."$ID".windows aerospace_workspace_change \
            --set       workspaces."$ID".windows \
                        click_script="aerospace workspace $ID" \
                        icon.drawing=off \
                        icon.y_offset=1 \
                        label.font="sketchybar-app-font:Regular:14.0" \
                        label.y_offset=0 \
                        label=" —" \
                        label.padding_left=0 \
                        label.padding_right=20 \
                        script="$PLUGIN_SHARED_DIR/aerospace_focus.sh $ID"

     ADD_SPACER=true   
done

$BAR_NAME \
        --add item workspaces_spacer_2 "$POSITION" \
        --subscribe workspaces_spacer_2 aerospace_workspace_change \
        --set      workspaces_spacer_2 \
                        script="$PLUGIN_SHARED_DIR/aerospace_windows.sh $MONITOR_ID" \
                        width=1 \
                        label.drawing=off