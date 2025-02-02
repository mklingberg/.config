#!/usr/bin/env bash
source "$HOME/.config/$BAR_NAME/theme.sh" # Loads all defined colors

PADDING_RIGHT=8
PADDING_LEFT=12

PADDING_RIGHT_SELECTED=20
PADDING_LEFT_SELECTED=12
PADDING_RIGHT_OUTSIDE_SELECTED=4
PADDING_LEFT_OUTSIDE_SELECTED=8

ID=$1

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    $BAR_NAME \
        --set workspace."$ID" \
            background.color=$COLOR_SPACE_SELECTED_BG \
        --set workspaces."$ID" \
            icon.color=$COLOR_SPACE_SELECTED_SPACE_NO \
            background.color=$COLOR_SPACE_SELECTED_SPACE_NO_BG \
        --set workspaces."$ID".windows \
            label.color=$COLOR_SPACE_SELECTED_ICON
else
    $BAR_NAME \
        --set workspace."$ID" \
            background.color=$COLOR_SPACE_BG \
        --set workspaces."$ID" \
            icon.color=$COLOR_SPACE_SPACE_NO \
            background.color=$COLOR_SPACE_SPACE_NO_BG \
        --set workspaces."$ID".windows \
            label.color=$COLOR_SPACE_ICON
fi