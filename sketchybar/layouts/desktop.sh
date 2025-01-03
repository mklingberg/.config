#!/bin/bash
source "$HOME/.config/$BAR_NAME/theme.sh"

PLUGIN_DIR="$HOME/.config/sketchybar/plugins-desktop"
PLUGIN_SHARED_DIR="$HOME/.config/sketchybar/plugins"
ITEM_DIR="$CONFIG_DIR/items"

SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"

BAR_HEIGHT=22
SEPARATOR_WIDTH=12
DEFAULT_PADDING=1

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
    padding_left=0
    padding_right=0
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

reload=(
    icon=$ICON_APPLE
    icon.color=$COLOR_RELOAD_ICON
    icon.padding_left=0
    icon.padding_right=5
    background.color=$COLOR_RELOAD_BG
    label=$DISPLAY_NUMBER
    label.padding_right=0
    label.padding_left=0
    script="$PLUGIN_SHARED_DIR/reload.sh"
)

reload_separator=(
    icon=$ICON_SEPARATOR_RIGHT
    icon.color=$COLOR_RELOAD_BG
    background.color=$COLOR_UTILS_BG
    icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0"
    icon.padding_left=0
    icon.padding_right=0
)

# ------------------------
# LEFT
# ------------------------
#󰑓
$BAR_NAME \
    --add item separator_reload_1 left \
    --set separator_reload_1 \
            icon.padding_left=0 \
            icon.padding_right=$SEPARATOR_WIDTH \
    --add item reload left \
    --set reload "${reload[@]}" \
    --subscribe reload mouse.clicked mouse.entered mouse.exited \
    --add item separator_reload_2 left \
    --set separator_reload_2 \
            icon.padding_left=-6 \
            icon.padding_right=$SEPARATOR_WIDTH \
    --add bracket reload_bracket \
              reload \
              separator_reload_1 \
              separator_reload_2 \
    --set reload_bracket \
              background.color=$COLOR_RELOAD_BG \
    --add item reload.separator left \
    --set reload.separator "${reload_separator[@]}"


# -- UTILS --

cpu_user=(
    update_freq=3
    icon=$ICON_CPU_IDLE
    icon.color=$COLOR_STATS
    icon.padding_left=10
    icon.padding_right=10
    label.padding_right=10
    label.padding_left=-5
    label.color=$COLOR_STATS
    #label.width=30
    label.drawing=false
    script="$PLUGIN_SHARED_DIR/cpu_load_label.sh"
)

cpu_sys=(
    update_freq=3
    icon=$ICON_CPU_SYS
    icon.color=$COLOR_STATS
    icon.padding_left=10
    icon.padding_right=10
    label.padding_right=10
    label.padding_left=-5
    label.color=$COLOR_STATS
    drawing=false
    script="$PLUGIN_SHARED_DIR/cpu_sys.sh"
)

docker_cpu=(
    drawing=false
    update_freq=60
    icon=$ICON_DOCKER
    icon.color=$COLOR_STATS
    icon.padding_left=8
    icon.padding_right=10
    label.drawing=false
    label.padding_left=-5
    label.padding_right=10
    label.color=$COLOR_STATS
    script="$PLUGIN_SHARED_DIR/docker_cpu.sh"
)

docker_memory=(
    drawing=false
    update_freq=120
    icon.drawing=false
    label.padding_left=-5
    label.padding_right=10
    label.color=$COLOR_STATS
    script="$PLUGIN_SHARED_DIR/docker_memory.sh"
)

utils_separator=(
    icon=$ICON_SEPARATOR_RIGHT
    icon.color=$COLOR_UTILS_BG
    icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0"
    icon.padding_left=0
    icon.padding_right=-2
    background.color=$COLOR_UTILS_UPDATES_BG
)

# -- UTILS UPDATES / BREW --

brew=(
    icon=$ICON_BREW
    icon.padding_right=0
    label.padding_left=8
    label.drawing=off
    update_freq=120
    script="$PLUGIN_SHARED_DIR/brew.sh"
)

utils_update_separator=(
    icon=$ICON_SEPARATOR_RIGHT
    icon.color=$COLOR_UTILS_UPDATES_BG
    icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0"
    icon.padding_left=0
    icon.padding_right=-2
    background.color=$TRANSPARENT
)

# Add a new item to SketchyBar
    
$BAR_NAME \
    --add item separator_utils_1 left \
    --set separator_utils_1 \
                icon.padding_left=-12 \
                icon.padding_right=$SEPARATOR_WIDTH \
                label.drawing=off \
    --add item cpu_user left \
    --set cpu_user "${cpu_user[@]}" \
    --add item cpu_sys left \
    --set cpu_sys "${cpu_sys[@]}" \
    --add item docker_cpu left \
    --set docker_cpu "${docker_cpu[@]}" \
    --add item docker_memory left \
    --set docker_memory "${docker_memory[@]}" \
    --add item separator_utils_2 left \
    --set separator_utils_2 \
                icon.padding_left=-12 \
                icon.padding_right=$SEPARATOR_WIDTH \
                label.drawing=off \
    --add bracket utils_bracket \
                separator_utils_1 \
                separator_utils_2 \
                cpu_user \
                cpu_sys \
    --set utils_bracket \
                background.color=$COLOR_UTILS_BG \
    --add item utils.separator left \
    --set utils.separator "${utils_separator[@]}" \
    --add item separator_utils_update_1 left \
    --set separator_utils_update_1 \
            icon.padding_left=0 \
            icon.padding_right=$SEPARATOR_WIDTH \
    --add event brew_update \
    --add item brew left \
    --set brew "${brew[@]}" \
    --subscribe brew brew_update \
    --add item separator_utils_update_2 left \
    --set separator_utils_update_2 \
            icon.padding_left=-4 \
            icon.padding_right=$SEPARATOR_WIDTH \
    --add item utils_update_separator left \
    --set utils_update_separator "${utils_update_separator[@]}" \
    --add bracket utils_update_bracket \
                separator_utils_update_1 \
                separator_utils_update_2 \
                brew \
    --set utils_update_bracket \
                background.color=$COLOR_UTILS_UPDATES_BG


# ------------------------
# CENTER
# ------------------------

# -- SPOTIFY --

spotify=(
    icon=$ICON_SPOTIFY
    icon.padding_left=0
    icon.padding_right=0
    label.padding_right=6
    label.padding_left=0
    label.drawing=off
    label.y_offset=2
    background.color=$COLOR_SPOTIFY_BG
    script="$PLUGIN_DIR/spotify.sh"
)

spotify_separator=(
    icon=$ICON_SEPARATOR_LEFT
    icon.color=$COLOR_SPOTIFY_BG
    icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0"
    icon.padding_left=0
    icon.padding_right=-2
    background.color=$COLOR_SPOTIFY_SEPARATOR2
)

spotify_separator2=(
    icon=$ICON_SEPARATOR_LEFT
    icon.color=$COLOR_SPOTIFY_SEPARATOR2
    background.color=$TRANSPARENT
    icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0"
    icon.padding_left=0
    icon.padding_right=-4
    label.drawing=false
)

$BAR_NAME \
    --add item spotify.separator2 center \
    --set spotify.separator2 "${spotify_separator2[@]}" \
    --add item spotify.separator center \
    --set spotify.separator "${spotify_separator[@]}" \
    --add item separator_spotify_1 center \
    --set separator_spotify_1 \
            icon.padding_left=-4 \
            icon.padding_right=$SEPARATOR_WIDTH \
            label.drawing=off \
    --add event spotify_change $SPOTIFY_EVENT \
    --add item spotify center \
    --set spotify "${spotify[@]}" \
    --subscribe spotify spotify_change mouse.clicked \
    --add item separator_spotify_2 center \
    --set separator_spotify_2 \
            icon.padding_left=-1 \
            icon.padding_right=$SEPARATOR_WIDTH \
            label.drawing=off \
    --add bracket spotify_bracket \
            separator_spotify_1 \
            separator_spotify_2 \
            spotify \
    --set spotify_bracket \
            background.color=$COLOR_SPOTIFY_BG

# -- SPACES --

spaces_separator_1=(
    icon=$ICON_SEPARATOR_LEFT
    icon.color=$COLOR_SPACE_BG
    background.color=$COLOR_SPOTIFY_BG
    label.padding_right=0
    icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0"
    icon.padding_left=0
    icon.padding_right=-2
)

spaces_separator_3=(
    icon=$ICON_SEPARATOR_RIGHT
    icon.color=$COLOR_SPACE_BG
    background.color=$COLOR_SPOTIFY_BG
    label.padding_right=0
    icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0"
    icon.padding_left=0
    icon.padding_right=-2
)

$BAR_NAME \
    --add item spaces_separator_1 center \
    --set spaces_separator_1 "${spaces_separator_1[@]}" \
    --add item spaces_separator_2 center \
    --set spaces_separator_2 \
            icon.padding_left=-8 \
            icon.padding_right=$SEPARATOR_WIDTH

source $ITEM_DIR/spaces.sh

$BAR_NAME \
    --add item spaces_separator_21 center \
    --set spaces_separator_21 \
            icon.padding_left=0 \
            icon.padding_right=$SEPARATOR_WIDTH \
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
            spaces_separator_2 \
            spaces_separator_21 \
    --set spaces_bracket \
            background.color=$COLOR_SPACE_BG \
            background.padding_left=0 \
            background.padding_right=0 \
    --add item spaces_separator_3 center \
    --set spaces_separator_3 "${spaces_separator_3[@]}" \
    --add item separator_front_app_1 center \
    --set separator_front_app_1 \
            icon.padding_left=0 \
            icon.padding_right=$SEPARATOR_WIDTH

# -- FRONT APP --

front_app_separator=(
    icon=$ICON_SEPARATOR_RIGHT
    icon.color=$COLOR_FRONT_APP_BG
    background.color=$COLOR_FRONT_APP_SEPARATOR2
    icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0"
    icon.padding_left=0
    icon.padding_right=-2
    label.drawing=no
)

front_app_separator2=(
    icon=$ICON_SEPARATOR_RIGHT
    icon.color=$COLOR_FRONT_APP_SEPARATOR2
    background.color=$TRANSPARENT
    icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0"
    icon.padding_left=-2
    icon.padding_right=0
    label.drawing=false
)

front_app=(
    background.padding_left=0
    background.padding_right=0
    icon.font="sketchybar-app-font:Regular:$FRONT_APP_ICON_SIZE.0"
    icon.padding_right=5
    icon.padding_left=0
    icon.color=$COLOR_FRONT_APP_ICON
    icon.y_offset=0
    label.drawing=no
    script="$PLUGIN_SHARED_DIR/front_app.sh"
)

front_app_name=(
    icon.drawing=off
    label.font="$FONT_FACE:Bold:$FRONT_APP_NAME_SIZE.0"
    label.color=$COLOR_FRONT_APP_NAME
    background.color=$COLOR_FRONT_APP_NAME_BG
    label.padding_left=5
    label.padding_right=0
)

$BAR_NAME \
    --add item front_app center \
    --set front_app "${front_app[@]}" \
    --add item front_app.name center \
    --set front_app.name "${front_app_name[@]}" \
    --add item separator_front_app_2 center \
    --set separator_front_app_2 \
            icon.padding_left=0 \
            icon.padding_right=$SEPARATOR_WIDTH \
    --add item front_app.separator center \
    --set front_app.separator "${front_app_separator[@]}" \
    --add bracket front_app_bracket \
            front_app \
            front_app.name \
            separator_front_app_2 \
            separator_front_app_1 \
     --set front_app_bracket \
            background.color=$COLOR_FRONT_APP_BG \
    --subscribe front_app front_app_switched mouse.clicked \
    --add item front_app.separator2 center \
    --set front_app.separator2 "${front_app_separator2[@]}"


# ------------------------
# RIGHT
# ------------------------

# -- DATE & TIME --

clock_separator=(
    icon=$ICON_SEPARATOR_LEFT
    icon.color=$COLOR_RIGHT_AREA_BG
    background.color=$COLOR_DATE_BG
    icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0"
    icon.padding_left=0
    icon.padding_right=-2
)

clock=(
    label.color=$COLOR_RIGHT_AREA_TEXT
    icon.drawing=no
    update_freq=10
    script="$PLUGIN_SHARED_DIR/time.sh"
)

clock_icon=(
    icon=$ICON_CLOCK
    icon.color=$COLOR_CLOCK
    icon.y_offset=0
    icon.padding_left=10
    icon.padding_right=0
    label.padding_left=0
    label.padding_right=0
)

date=(
    label.color=$COLOR_DATE_TEXT
    background.color=$COLOR_DATE_BG
    icon.drawing=no
    update_freq=120
    script="$PLUGIN_SHARED_DIR/date.sh"
)

date_separator=(
    icon=$ICON_SEPARATOR_LEFT
    icon.color=$COLOR_DATE_BG
    background.color=$COLOR_UTILS_RIGHT_BG
    icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0"
    icon.padding_left=0
    icon.padding_right=-2
)

$BAR_NAME \
    --add item separator_clock_1 right \
    --set separator_clock_1 \
            icon.padding_left=0 \
            icon.padding_right=$SEPARATOR_WIDTH \
    --add item clock_icon right \
    --set clock_icon "${clock_icon[@]}" \
    --add item clock right \
    --set clock "${clock[@]}" \
    --add item separator_clock_2 right \
    --set separator_clock_2 \
            icon.padding_left=0 \
            icon.padding_right=$SEPARATOR_WIDTH \
    --add bracket clock_bracket \
            separator_clock_1 \
            separator_clock_2 \
            clock \
    --set clock_bracket \
            background.color=$COLOR_RIGHT_AREA_BG \
    --add item clock.separator right \
    --set clock.separator "${clock_separator[@]}" \
    --add item separator_date_1 right \
    --set separator_date_1 \
            icon.padding_left=4 \
            icon.padding_right=$SEPARATOR_WIDTH \
    --add item date right \
    --set date "${date[@]}" \
    --add item separator_date_2 right \
    --set separator_date_2 \
            icon.padding_left=0 \
            icon.padding_right=$SEPARATOR_WIDTH \
    --add item date.separator right \
    --set date.separator "${date_separator[@]}" \
    --add bracket date_bracket \
            separator_date_1 \
            separator_date_2 \
            date \
    --set date_bracket \
            background.color=$COLOR_DATE_BG


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

utils_r_separator=(
    icon=$ICON_SEPARATOR_LEFT
    icon.color=$COLOR_UTILS_RIGHT_BG
    background.color=$TRANSPARENT
    icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0"
    icon.padding_left=0
    icon.padding_right=-2
)

$BAR_NAME \
    --add item separator_utils_r_1 right \
    --set separator_utils_r_1 \
            icon.padding_left=-6 \
            icon.padding_right=$SEPARATOR_WIDTH \
    --add item airpods_case right \
    --set airpods_case "${airpods_case[@]}" \
    --add item airpods right \
    --set airpods "${airpods[@]}" \
    --add item volume right \
    --set volume "${volume[@]}" \
    --subscribe volume volume_change \
    --add item separator_utils_r_2 right \
    --set separator_utils_r_2 \
            icon.padding_left=-22 \
            icon.padding_right=$SEPARATOR_WIDTH \
    --add bracket utils_right \
            separator_utils_r_1 \
            separator_utils_r_2 \
            airpods_case \
            airpods \
            volume \
    --set utils_right \
            background.color=$COLOR_UTILS_RIGHT_BG \
    --add item utils_right.separator right \
    --set utils_right.separator "${utils_r_separator[@]}"

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