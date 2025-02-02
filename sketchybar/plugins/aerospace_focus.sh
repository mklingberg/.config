#!/usr/bin/env bash
source "$HOME/.config/$BAR_NAME/theme.sh" # Loads all defined colors

PADDING_RIGHT=8
PADDING_LEFT=12

PADDING_RIGHT_SELECTED=20
PADDING_LEFT_SELECTED=12
PADDING_RIGHT_OUTSIDE_SELECTED=4
PADDING_LEFT_OUTSIDE_SELECTED=8

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    $BAR_NAME \
        --set $NAME \
            icon.font="$FONT_FACE:Medium:22.0" \
            label.font="sketchybar-app-font:Regular:14.0" \
            label.color=$COLOR_SPACE_SELECTED_ICON \
            icon.color=$COLOR_SPACE_SELECTED_SPACE_NO \
            icon.padding_left=$PADDING_LEFT_SELECTED \
            icon.padding_right=5 \
            label.padding_left=0 \
            label.padding_right=$PADDING_RIGHT_SELECTED \
            background.color=$COLOR_SPACE_SELECTED_BG \
            background.corner_radius=10 \
            background.padding_left=$PADDING_LEFT_OUTSIDE_SELECTED \
            background.padding_right=$PADDING_RIGHT_OUTSIDE_SELECTED \
            background.height=20
else
    $BAR_NAME \
        --set $NAME \
            icon.font="$FONT_FACE:Medium:15.0" \
            label.font="sketchybar-app-font:Regular:13.0" \
            label.color=$COLOR_SPACE_ICON \
            icon.color=$COLOR_SPACE_SPACE_NO \
            icon.padding_left=$PADDING_LEFT \
            icon.padding_right=5 \
            label.padding_left=0 \
            label.padding_right=$PADDING_RIGHT \
            background.corner_radius=8 \
            background.color=$TRANSPARENT \
            background.padding_left=0 \
            background.padding_right=0
fi