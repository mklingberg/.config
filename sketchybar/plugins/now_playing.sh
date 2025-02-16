#!/bin/bash

# Spotify JSON / $INFO comes in malformed, line below sanitizes it
SPOTIFY_JSON="$INFO"

update_track() {
    PLAYER_STATE=$(echo "$SPOTIFY_JSON" | jq -r '.["Player State"]')
    TRACK="$(echo "$SPOTIFY_JSON" | jq -r .Name)"
    ARTIST="$(echo "$SPOTIFY_JSON" | jq -r .Artist)"

    $BAR_NAME \
        --set now_playing.artist label="$ARTIST" \
        --set now_playing.track label="$TRACK"
}

case "$SENDER" in
"mouse.clicked")
    osascript -e 'tell application "Spotify" to playpause'
    ;;
*)
    update_track
    ;;
esac
