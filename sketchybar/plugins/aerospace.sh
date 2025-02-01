#!/usr/bin/env bash
source "$HOME/.config/$BAR_NAME/theme.sh" # Loads all defined colors

PADDING_RIGHT=4
PADDING_LEFT=4

PADDING_RIGHT_SELECTED=8
PADDING_LEFT_SELECTED=6
PADDING_RIGHT_OUTSIDE_SELECTED=6
PADDING_LEFT_OUTSIDE_SELECTED=6

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    $BAR_NAME \
        --set $NAME \
            icon.font="$FONT_FACE:Medium:22.0" \
            label.font="sketchybar-app-font:Regular:14.0" \
            label.color=$COLOR_SPACE_SELECTED_ICON \
            icon.color=$COLOR_SPACE_SELECTED_SPACE_NO \
            icon.padding_left=$PADDING_LEFT_SELECTED \
            icon.padding_right=$PADDING_RIGHT_SELECTED \
            label.padding_left=0 \
            label.padding_right=$PADDING_RIGHT_SELECTED \
            background.color=$COLOR_SPACE_SELECTED_BG \
            background.corner_radius=8 \
            background.padding_left=$PADDING_LEFT_OUTSIDE_SELECTED \
            background.padding_right=$PADDING_RIGHT_OUTSIDE_SELECTED \
            background.height=16
else
    $BAR_NAME \
        --set $NAME \
            icon.font="$FONT_FACE:Medium:15.0" \
            label.font="sketchybar-app-font:Regular:13.0" \
            label.color=$COLOR_SPACE_ICON \
            icon.color=$COLOR_SPACE_SPACE_NO \
            icon.padding_left=$PADDING_LEFT \
            icon.padding_right=$PADDING_RIGHT \
            label.padding_left=0 \
            label.padding_right=$PADDING_RIGHT \
            background.corner_radius=8 \
            background.color=$TRANSPARENT \
            background.padding_left=1 \
            background.padding_right=1
fi