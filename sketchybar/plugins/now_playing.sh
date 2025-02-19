#!/bin/bash

source "$HOME/.config/$BAR_NAME/theme.sh"

# Spotify JSON / $INFO comes in malformed, line below sanitizes it
SPOTIFY_JSON="$INFO"

DEFAULT_Y_OFFSET=20
HIDDEN_Y_OFFSET=-1000

update_media_changed() {
    PLAYER_STATE="$(echo "$INFO" | jq -r .state)"
    TITLE="$(echo "$INFO" | jq -r .title)"
    ARTIST="$(echo "$INFO" | jq -r .artist)"
    APP="$(echo "$INFO" | jq -r .app)"
    
    # Only show playback for spotify as of now
    if [ "$APP" != "Spotify" ]; then
        # Hide now playing bar if not spotify
        $BAR_NAME --bar y_offset=$HIDDEN_Y_OFFSET
        return 0
    fi

    ICON=$ICON_NOW_PLAYING

    if [ "$PLAYER_STATE" = "playing" ]; then
        ICON=$ICON_NOW_PLAYING_PLAYING
    elif [ "$PLAYER_STATE" = "paused" ]; then
        ICON=$ICON_NOW_PLAYING_PAUSED
    elif [ "$PLAYER_STATE" = "stopped" ]; then
        $BAR_NAME --bar y_offset=$HIDDEN_Y_OFFSET
        #ICON=$ICON_NOW_PLAYING_STOPPED
        return 0
    fi

    $BAR_NAME \
        --bar y_offset=$DEFAULT_Y_OFFSET \
        --set artist label="$ARTIST" \
        --set track label="$TITLE" \
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
        $BAR_NAME \
            --bar hidden=off \
            --trigger media_change
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
    "media_change")
        update_media_changed
        ;;
esac
