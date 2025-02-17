#!/bin/bash

source "$HOME/.config/$BAR_NAME/theme.sh"

# Spotify JSON / $INFO comes in malformed, line below sanitizes it
SPOTIFY_JSON="$INFO"

DEFAULT_Y_OFFSET=20
HIDDEN_Y_OFFSET=-1000

update_track() {
    PLAYER_STATE=$(echo "$SPOTIFY_JSON" | jq -r '.["Player State"]')
    TRACK="$(echo "$SPOTIFY_JSON" | jq -r .Name)"
    ARTIST="$(echo "$SPOTIFY_JSON" | jq -r .Artist)"
    ICON=$ICON_NOW_PLAYING

    if [ "$PLAYER_STATE" = "Playing" ]; then
        ICON=$ICON_NOW_PLAYING_PLAYING
    elif [ "$PLAYER_STATE" = "Paused" ]; then
        ICON=$ICON_NOW_PLAYING_PAUSED
    elif [ "$PLAYER_STATE" = "Stopped" ]; then
        ICON=$ICON_NOW_PLAYING_STOPPED
    fi

    $BAR_NAME \
        --set artist label="$ARTIST" \
        --set track label="$TRACK" \
        --set icon icon=$ICON
}

case "$SENDER" in
# Toggle the bar between hidden and visible
# in order to turn it on and off
# No updates are receviced when the bar is hidden
# and its effectively idle
"toggle_enabled")
    HIDDEN=$($BAR_NAME --query bar | jq -r .hidden)
    if [ "$HIDDEN" = "on" ]; then
       $BAR_NAME --bar hidden=off
    else
       $BAR_NAME --bar hidden=on
    fi
    ;;

# As update scripts are not run when the bar is hidden
# we use offset to hide the bar, allowing the script to run
# even if the bar is "hidden"
"toggle_hidden")
    Y_OFFSET=$($BAR_NAME --query bar | jq -r .y_offset)
    if [ "$Y_OFFSET" = "$HIDDEN_Y_OFFSET" ]; then
        $BAR_NAME --bar y_offset=$DEFAULT_Y_OFFSET
    else
        $BAR_NAME --bar y_offset=$HIDDEN_Y_OFFSET
    fi
    ;;

"set_visible")
    $BAR_NAME --bar y_offset=$DEFAULT_Y_OFFSET
    ;;
"set_hidden")
    $BAR_NAME --bar y_offset=$HIDDEN_Y_OFFSET
    ;;
"set_enabled")
    $BAR_NAME --bar hidden=off
    ;;
"set_disabled")
    $BAR_NAME --bar hidden=on
    ;;
"mouse.clicked")
    osascript -e 'tell application "Spotify" to playpause'
    ;;
"spotify_change")
    update_track
    ;;
esac
