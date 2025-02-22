#!/bin/bash
source "$HOME/.config/$BAR_NAME/theme.sh"

# Global settings

PLUGIN_DIR="$HOME/.config/sketchybar/plugins-desktop"
PLUGIN_SHARED_DIR="$HOME/.config/sketchybar/plugins"
ITEM_DIR="$CONFIG_DIR/items"

BAR_HEIGHT=300
MARGIN_RIGHT=20
MARGIN_BOTTOM=20
DEFAULT_Y_OFFSET=20
HIDDEN_Y_OFFSET=-1000

bar=(
    height=$BAR_HEIGHT
    color=$TRANSPARENT
    display=main
    topmost=on
    position=bottom
    y_offset=$HIDDEN_Y_OFFSET
)

default=(
    background.height=$BAR_HEIGHT
)

icon=(
    icon.width=200
    background.padding_right=-200
    icon.color=0xeeffffff
    icon.y_offset=76
    icon.align=right
    icon.padding_right=8
    icon=$COLOR_NOW_PLAYING_ICON
    icon.font.size=32
)

thumbnail=(
    background.height=200
    icon.width=200
    background.drawing=on
    background.image="media.artwork"
    background.image.corner_radius=20
    background.image.scale=6.20
    background.image.y_offset=0
    script="$PLUGIN_SHARED_DIR/now_playing_player.sh"
)

artist=(
    background.padding_right=-200
    background.height=20
    scroll_texts=on
    label="Artist"
    label.max_chars=26
    label.align=center
    label.width=200
    label.y_offset=-132
    label.font.size=12
    label.color=$COLOR_NOW_PLAYING_ARTIST
)

track=(
    background.padding_right=-200
    background.height=20
    scroll_texts=on
    label="Track"
    label.max_chars=20
    label.align=center
    label.width=200
    label.y_offset=-114
    label.font.style=Bold
    label.font.size=14
    label.color=$COLOR_NOW_PLAYING_TRACK
)

$BAR_NAME \
    --bar "${bar[@]}" \
    --default "${default[@]}" \
    --add event set_visible \
    --add event set_hidden \
    --add event set_enabled \
    --add event set_disabled \
    --add event toggle_hidden \
    --add event toggle_enabled \
    --add item spacer_outer right \
    --set spacer_outer \
        width=$MARGIN_RIGHT \
        label.drawing=off \
    --add item spacer_1 right \
    --set spacer_1 \
        width=8 \
        label.drawing=off \
    --add item thumbnail right \
    --set thumbnail "${thumbnail[@]}" \
    --subscribe thumbnail mouse.clicked set_visible set_hidden set_enabled set_disabled toggle_hidden toggle_enabled media_change \
    --add item artist right \
    --set artist "${artist[@]}" \
    --add item track right \
    --set track "${track[@]}" \
    --add item icon right \
    --set icon "${icon[@]}" \
    --add item spacer_2 right \
    --set spacer_2 \
        width=6 \
        label.drawing=off \
    --add bracket wrapper \
        spacer_1 \
        icon \
        thumbnail \
        artist \
        track \
        spacer_2 \
    --set wrapper \
        background.height=254 \
        background.corner_radius=26 \
        background.y_offset=-18 \
        background.color=$COLOR_NOW_PLAYING_BG

$BAR_NAME --update