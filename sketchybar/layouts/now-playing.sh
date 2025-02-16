#!/bin/bash
source "$HOME/.config/$BAR_NAME/theme.sh"

# Global settings

PLUGIN_DIR="$HOME/.config/sketchybar/plugins-desktop"
PLUGIN_SHARED_DIR="$HOME/.config/sketchybar/plugins"
ITEM_DIR="$CONFIG_DIR/items"
SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"

BAR_HEIGHT=300

bar=(
    height=$BAR_HEIGHT
    color=$TRANSPARENT
    #width=200
    #margin=10
    #padding_left=8
    #padding_right=20
    display=1
    topmost=on
    position=bottom
    y_offset=10
)

default=(
    background.height=$BAR_HEIGHT
    #icon.color=$COLOR_TEXT
    #icon.font="$FONT_FACE:Medium:16.0"
    #icon.padding_left=0
    #icon.padding_right=0
    #icon.y_offset=0
    #label.color=$COLOR_TEXT
    #label.font="$FONT_FACE:Medium:14.0"
    #label.y_offset=1
    #label.padding_left=0
    #label.padding_right=0
)

now_playing_thumbnail=(
    background.height=200
    width=200
    #label.drawing=off
    #icon.drawing=off
    background.drawing=on
    background.image="media.artwork"
    background.image.corner_radius=20
    background.image.scale=6.2
    background.image.y_offset=0
    script="$PLUGIN_SHARED_DIR/now_playing.sh"
)

now_playing_artist=(
    #width=200
    background.padding_right=-200
    background.height=20
    scroll_texts=on
    label="Artist"
    label.max_chars=26
    label.align=center
    label.width=200
    label.y_offset=-136
    label.font.size=12
    label.color=$COLOR_WHITE
)

now_playing_track=(
    background.padding_right=-200
    background.height=20
    scroll_texts=on
    label="Track"
    label.max_chars=20
    label.align=center
    label.width=200
    label.y_offset=-112
    label.font.style=Bold
    label.font.size=16
    label.color=$COLOR_WHITE
)

$BAR_NAME \
    --bar "${bar[@]}" \
    --default "${default[@]}" \
    --add event spotify_change $SPOTIFY_EVENT \
    --add item spacer_1 right \
    --set spacer_1 \
          width=1 \
          label.drawing=off \
    --add item now_playing.thumbnail right \
    --set now_playing.thumbnail "${now_playing_thumbnail[@]}" \
    --subscribe now_playing.thumbnail spotify_change mouse.clicked \
    --add item now_playing.artist right \
    --set now_playing.artist "${now_playing_artist[@]}" \
    --add item now_playing.track right \
    --set now_playing.track "${now_playing_track[@]}" \
    --add item spacer_2 right \
    --set spacer_2 \
          width=1 \
          label.drawing=off \
    --add bracket now_playing.bracket \
            spacer_1 \
            now_playing.thumbnail \
            now_playing.artist \
            now_playing.track \
            spacer_2 \
    --set now_playing.bracket \
            background.height=248 \
            background.corner_radius=22 \
            background.y_offset=-22 \
            background.color=0x22000000 

echo "Now Playing plugin loaded"

$BAR_NAME --update