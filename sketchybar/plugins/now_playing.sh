#!/bin/bash

source "$HOME/.config/$BAR_NAME/theme.sh"

# Spotify JSON / $INFO comes in malformed, line below sanitizes it
SPOTIFY_JSON="$INFO"

update_track() {
    PLAYER_STATE=$(echo "$SPOTIFY_JSON" | jq -r '.["Player State"]')
    TRACK="$(echo "$SPOTIFY_JSON" | jq -r .Name)"
    ARTIST="$(echo "$SPOTIFY_JSON" | jq -r .Artist)"
    ICON=$ICON_SPOTIFY

    if [ "$PLAYER_STATE" = "Playing" ]; then
        ICON=$ICON_SPOTIFY_PLAY
    elif [ "$PLAYER_STATE" = "Paused" ]; then
        ICON=$ICON_SPOTIFY_PAUSE
    elif [ "$PLAYER_STATE" = "Stopped" ]; then
        ICON=$ICON_SPOTIFY_PAUSE
    else
        ICON=$ICON_SPOTIFY
    fi

    $BAR_NAME \
        --set now_playing.artist label="$ARTIST" \
        --set now_playing.track label="$TRACK" \
        --set icon icon=$ICON
}


case "$SENDER" in
"mouse.clicked")
    osascript -e 'tell application "Spotify" to playpause'
    ;;
*)
    update_track
    ;;
esac
