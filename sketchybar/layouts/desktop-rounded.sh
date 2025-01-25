#!/bin/bash
source "$HOME/.config/$BAR_NAME/theme.sh"

PLUGIN_DIR="$HOME/.config/sketchybar/plugins-desktop"
PLUGIN_SHARED_DIR="$HOME/.config/sketchybar/plugins"
ITEM_DIR="$CONFIG_DIR/items"

SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"

BAR_HEIGHT=26
SEPARATOR_WIDTH=12
DEFAULT_PADDING=1

DEFAULT_RADIUS=12
INNER_RADIUS=11

OUTER_HEIGHT=24
INNER_HEIGHT=22

FRONT_APP_ICON_SIZE=14
FRONT_APP_NAME_SIZE=15

# ------------------------
# MAIN BAR
# ------------------------

bar=(
    height=$BAR_HEIGHT
    color=$COLOR_BAR
    margin=0
    sticky=on
    padding_left=2
    padding_right=2
    display=$DISPLAY_NUMBER
)

default=(
    background.height=$BAR_HEIGHT
    icon.color=$COLOR_TEXT
    icon.font="$FONT_FACE:Medium:16.0"
    icon.padding_left=0
    icon.padding_right=0
    icon.y_offset=1
    label.color=$COLOR_TEXT
    label.font="$FONT_FACE:Medium:14.0"
    label.y_offset=1
    label.padding_left=0
    label.padding_right=0
)

$BAR_NAME \
    --bar "${bar[@]}" \
    --default "${default[@]}"

# ------------------------
# LEFT
# ------------------------

screen=(
    icon=$ICON_APPLE
    icon.color=$COLOR_RELOAD_ICON
    icon.padding_right=5
    label=$DISPLAY_NUMBER
    background.padding_left=10
    background.padding_right=10
    script="$PLUGIN_SHARED_DIR/reload.sh"
)

# -- UTILS --

cpu_user=(
    icon=$ICON_CPU_IDLE
    icon.color=$COLOR_STATS
    icon.padding_right=5
    label.color=$COLOR_STATS
    background.padding_left=10
    background.padding_right=5
    script="$PLUGIN_SHARED_DIR/cpu_load_label.sh"
)

brew=(
    icon=$ICON_BREW
    update_freq=120
    icon.padding_left=10
    icon.padding_right=10
    label.padding_right=10
    background.height=$INNER_HEIGHT
    background.corner_radius=$DEFAULT_RADIUS
    background.color=$COLOR_UTILS_UPDATES_BG
    script="$PLUGIN_SHARED_DIR/brew.sh"
)

# Add a new item to SketchyBar

$BAR_NAME \
    --add item screen left \
    --set screen "${screen[@]}" \
    --subscribe screen mouse.clicked mouse.entered mouse.exited \
    --add item cpu_user left \
    --set cpu_user "${cpu_user[@]}" \
    --add event brew_update \
    --add item brew left \
    --set brew "${brew[@]}" \
    --subscribe brew brew_update \
    --add item separator_utils_1 left \
    --add bracket left_bracket \
            screen \
            cpu_user \
            brew \
            separator_utils_1 \
    --set left_bracket \
            background.height=$OUTER_HEIGHT \
            background.corner_radius=$DEFAULT_RADIUS \
            background.padding_right=10 \
            background.padding_left=10 \
            background.color=$COLOR_RELOAD_BG \
    --add bracket left_bracket2 \
            cpu_user \
            brew \
    --set left_bracket2 \
            background.height=$INNER_HEIGHT \
            background.corner_radius=$INNER_RADIUS \
            background.padding_right=10 \
            background.padding_left=10 \
            background.color=$COLOR_UTILS_BG


# ------------------------
# CENTER
# ------------------------

# -- SPOTIFY --

spotify=(
    icon=$ICON_SPOTIFY
    label.drawing=off
    background.padding_left=12
    background.padding_right=10
    script="$PLUGIN_DIR/spotify.sh"
)

$BAR_NAME \
    --add event spotify_change $SPOTIFY_EVENT \
    --add item spotify center \
    --set spotify "${spotify[@]}" \
    --subscribe spotify spotify_change mouse.clicked \
    --add item separator_spotify_2 center \
    --add bracket spotify_bracket \
            spotify \
    --set spotify_bracket \
            background.padding_right=10 \
            background.padding_left=10

# -- SPACES --

source $ITEM_DIR/spaces.sh

front_app=(
    icon.font="sketchybar-app-font:Regular:14.0"
    icon.color=$COLOR_FRONT_APP_ICON
    label.drawing=no
    background.padding_right=10
    background.padding_left=10
    script="$PLUGIN_SHARED_DIR/front_app.sh"
)

front_app_name=(
    icon.drawing=off
    background.padding_right=12
    background.padding_left=0
    label.color=$COLOR_FRONT_APP_NAME
)

$BAR_NAME \
    --add item front_app center \
    --set front_app "${front_app[@]}" \
    --add item front_app.name center \
    --set front_app.name "${front_app_name[@]}" \
    --add bracket front_app_bracket \
            front_app \
            front_app.name \
    --set front_app_bracket \
            background.padding_right=10 \
            background.padding_left=10 \
    --subscribe front_app front_app_switched mouse.clicked \
    --add bracket center_bracket \
            spotify_bracket \
            front_app_bracket \
    --set center_bracket \
            background.height=$OUTER_HEIGHT \
            background.corner_radius=$DEFAULT_RADIUS \
            background.padding_right=10 \
            background.padding_left=10 \
            background.color=$COLOR_SPOTIFY_BG \
    --add bracket spaces_bracket \
            space.1 \
            space.2 \
            space.3 \
            space.4 \
            space.5 \
            space.6 \
            space.7 \
            space.8 \
            space.9 \
            space.10 \
    --set spaces_bracket \
            background.height=$INNER_HEIGHT \
            background.corner_radius=$INNER_RADIUS \
            background.padding_right=10 \
            background.padding_left=10 \
            background.color=$COLOR_SPACE_BG


# ------------------------
# RIGHT
# ------------------------

# -- DATE & TIME --

clock=(
    icon.drawing=no
    update_freq=10
    background.padding_right=10
    background.padding_left=10
    script="$PLUGIN_SHARED_DIR/time.sh"
)

clock_icon=(
    icon=$ICON_CLOCK
    icon.color=$COLOR_CLOCK
    icon.y_offset=0
    background.padding_right=10
    background.padding_left=0
)

date=(
    label.color=$COLOR_DATE_TEXT
    background.padding_right=10
    background.padding_left=10
    icon.drawing=no
    update_freq=120
    script="$PLUGIN_SHARED_DIR/date.sh"
)

# -- UTILS RIGHT --

# VOLUME

volume=(
    icon=$ICON_VOLUME
    icon.color=$COLOR_STATS
    icon.padding_left=10
    icon.padding_right=10
    label.padding_right=10
    label.color=$COLOR_STATS
    #drawing=false
    label.drawing=false
    script="$PLUGIN_SHARED_DIR/volume.sh"
)

airpods=(
    drawing=false
    update_freq=5
    icon.font="$FONT_FACE:Medium:16.0"
    icon.color=$COLOR_STATS
    icon.padding_left=6
    icon.padding_right=10
    label.padding_left=-5
    label.padding_right=10
    label.color=$COLOR_STATS
    script="$PLUGIN_SHARED_DIR/airpods.sh"
)

airpods_case=(
    drawing=false
    update_freq=5
    icon.font="$FONT_FACE:Medium:21.0"
    icon.color=$COLOR_STATS
    icon.padding_left=8
    icon.padding_right=10
    label.padding_left=-5
    label.padding_right=10
    icon.y_offset=1
    label.color=$COLOR_STATS
    script="$PLUGIN_SHARED_DIR/airpods_case.sh"
)

$BAR_NAME \
    --add item clock_icon right \
    --set clock_icon "${clock_icon[@]}" \
    --add item clock right \
    --set clock "${clock[@]}" \
    --add item date right \
    --set date "${date[@]}" \
    --add item airpods_case right \
    --set airpods_case "${airpods_case[@]}" \
    --add item airpods right \
    --set airpods "${airpods[@]}" \
    --add item volume right \
    --set volume "${volume[@]}" \
    --subscribe volume volume_change \
    --add item separator_right right \
    --add bracket right_bracket \
            airpods_case \
            airpods \
            volume \
            clock_icon \
            clock \
            date \
            separator_right \
    --set right_bracket \
            background.height=$OUTER_HEIGHT \
            background.corner_radius=$DEFAULT_RADIUS \
            background.padding_right=10 \
            background.padding_left=10 \
            background.color=$COLOR_RIGHT_AREA_BG \
    --add bracket date_bracket \
            airpods_case \
            airpods \
            volume \
            date \
    --set date_bracket \
            background.height=$INNER_HEIGHT \
            background.corner_radius=$INNER_RADIUS \
            background.padding_right=10 \
            background.padding_left=10 \
            background.color=$COLOR_DATE_BG \
    --add bracket utils_right \
            airpods_case \
            airpods \
            volume \
    --set utils_right \
            background.height=$INNER_HEIGHT \
            background.corner_radius=$INNER_RADIUS \
            background.padding_right=10 \
            background.padding_left=10 \
            background.color=$COLOR_UTILS_RIGHT_BG

# ------------------------
# INIT
# ------------------------

$BAR_NAME --update
$BAR_NAME --trigger space_change
$BAR_NAME --trigger volume_change
$BAR_NAME --trigger display_change

# Quick toggle play pause in order to update now playing
osascript -e 'tell application "Spotify" to playpause'
osascript -e 'tell application "Spotify" to playpause'