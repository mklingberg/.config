#!/usr/bin/env bash

create_workspace_bracket_for_monitor() {
  parameters=("$@")
  monitor_id=${parameters[0]}
  monitor_workspaces=("${parameters[@]:1}")

  if [ $monitor_id -ne 1 ]; then
    $BAR_NAME \
            --add item workspaces_spacer_left center \
            --set      workspaces_spacer_left \
                          width=8 \
                          label.drawing=off
  fi

  for workspace_id in ${monitor_workspaces[@]}; do
    $BAR_NAME \
            --add item  workspaces."$monitor_id"."$workspace_id" center \
            --subscribe workspaces."$monitor_id"."$workspace_id" aerospace_workspace_change \
            --set       workspaces."$monitor_id"."$workspace_id" \
                        click_script="aerospace workspace $workspace_id" \
                        icon=$workspace_id \
                        icon.y_offset=1 \
                        label.drawing=off \
                        label.font="sketchybar-app-font:Regular:14.0" \
                        label.y_offset=0 \
                        script="$PLUGIN_SHARED_DIR/aerospace.sh $workspace_id"
  done

  if [ $monitor_id -lt ${#monitor_ids[@]} ]; then
    $BAR_NAME \
            --add item workspaces_monitor_separator."$monitor_id" center \
            --set      workspaces_monitor_separator."$monitor_id" \
                        label.padding_left=-6 \
                        label="|"
    
    $BAR_NAME \
            --add item workspaces_spacer_right center \
            --set      workspaces_spacer_right \
                        width=4 \
                        background.drawing=off \
                        label.drawing=off
  fi

  #$BAR_NAME \
  #          --add bracket workspaces."$monitor_id" /workspaces\.*/ \
  #          --set         workspaces."$monitor_id" \
  #                      background.padding_left="50" \
  #                      background.corner_radius="$BRACKET_BACKGROUND_CORNER_RADIUS" \
  #                      background.border_width="$BRACKET_BACKGROUND_BORDER_WIDTH"
}

$BAR_NAME \
        --add event aerospace_workspace_change \
        --add event aerospace_service_mode_enabled_changed

monitor_ids=( $(aerospace list-monitors | awk '{print $1}') )

$BAR_NAME \
        --add item workspaces_spacer_1 center \
        --set      workspaces_spacer_1 \
                        width=10 \
                        label.drawing=off
# TODO:
# - Update this view when moving workspaces to a different monitors.
# - Only show workspaces with active windows or currently selected like in i3
#   default configuration.
for monitor_id in ${monitor_ids[@]}; do
  workspaces_for_monitor_id=( $(aerospace list-workspaces --monitor $monitor_id) )
  create_workspace_bracket_for_monitor $monitor_id "${workspaces_for_monitor_id[@]}"
done

$BAR_NAME \
        --add item workspaces_spacer_2 center \
        --set      workspaces_spacer_2 \
                        width=10 \
                        label.drawing=off