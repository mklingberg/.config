#!/bin/bash
source "$HOME/.config/$BAR_NAME/theme.sh"

PLUGIN_DIR="$HOME/.config/sketchybar/plugins-laptop"
PLUGIN_SHARED_DIR="$HOME/.config/sketchybar/plugins"
ITEM_DIR="$CONFIG_DIR/items"
SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"

MARGIN_LEFT=0
MARGIN_RIGHT=0
BAR_HEIGHT=38
SEPARATOR_WIDTH=5

FRONT_APP_ICON_SIZE=16
FRONT_APP_NAME_SIZE=16

bar=(
    height=$BAR_HEIGHT
    color=$COLOR_BAR
    margin=0
    sticky=on
    padding_left=0
    padding_right=0
    notch_width=0
    display=$DISPLAY_NUMBER
)

default=(
    background.height=$BAR_HEIGHT
    icon.color=$COLOR_TEXT
    icon.font="$FONT_FACE:Medium:18.0"
    icon.padding_left=5
    icon.padding_right=5
    icon.y_offset=0
    label.color=$COLOR_TEXT
    label.font="$FONT_FACE:Medium:14.0"
    label.y_offset=0
    label.padding_left=5
    label.padding_right=5
)

$BAR_NAME \
    --bar "${bar[@]}" \
    --default "${default[@]}"

# ------------------------
# LEFT
# ------------------------

reload=(
    icon=$ICON_APPLE
    icon.color=$COLOR_RELOAD_ICON
    icon.padding_left=0
    icon.padding_right=5
    background.color=$COLOR_RELOAD_BG
    label.font="$FONT_FACE:Medium:16.0"
    label=$DISPLAY_NUMBER
    label.padding_right=1
    label.padding_left=0
    label.y_offset=-2
    script="$PLUGIN_SHARED_DIR/reload.sh"
)

reload_separator=(
    icon=$ICON_SEPARATOR_RIGHT
    icon.color=$COLOR_RELOAD_BG
    background.color=$COLOR_UTILS_LAPTOP_BG
    icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0"
    icon.padding_left=0
    icon.padding_right=0
)

$BAR_NAME \
    --add item separator_reload_1 left \
    --set separator_reload_1 \
            icon.padding_right=$SEPARATOR_WIDTH \
    --add item reload left \
    --set reload "${reload[@]}" \
    --subscribe reload mouse.clicked mouse.entered mouse.exited \
    --add item separator_reload_2 left \
    --set separator_reload_2 \
            icon.padding_right=0 \
    --add bracket reload_bracket \
              reload \
              separator_reload_1 \
              separator_reload_2 \
    --set reload_bracket \
            background.color=$COLOR_RELOAD_BG \
    --add item reload.separator left \
    --set reload.separator "${reload_separator[@]}"

# -- UTILS --

utils_separator=(
    icon=$ICON_SEPARATOR_RIGHT
    icon.color=$COLOR_UTILS_LAPTOP_BG
    icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0"
    icon.padding_left=0
    icon.padding_right=-12
    background.color=$COLOR_UTILS_SEPARATOR2
)

utils_separator2=(
    icon=$ICON_SEPARATOR_RIGHT
    icon.color=$COLOR_UTILS_SEPARATOR2
    background.color=$TRANSPARENT
    icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0"
    icon.padding_left=-6
    icon.padding_right=0
    label.drawing=false
)

battery=(
    update_freq=20
    #icon.font="$FONT_FACE:Medium:20.0"
    icon.padding_left=10
    icon.padding_right=8
    label.padding_right=10
    label.width=48
    script="$PLUGIN_DIR/battery.sh"
)

# cpu_user=(
#         update_freq=3
#         icon=$ICON_CPU_USER
#         icon.color=$COLOR_STATS
#         icon.padding_left=6
#         icon.padding_right=10
#         icon.y_offset=0
#         label.padding_right=10
#         label.padding_left=-5
#         label.color=$COLOR_STATS
#         #label.width=30
#         #drawing=false
#         script="$PLUGIN_SHARED_DIR/cpu_user.sh"
# )

cpu_user=(
    update_freq=3
    icon=$ICON_CPU_LOAD_1
    icon.color=$COLOR_STATS
    icon.padding_left=8
    icon.padding_right=10
    icon.y_offset=0
    label.drawing=false
    script="$PLUGIN_SHARED_DIR/cpu_load.sh"
)


$BAR_NAME \
    --add item separator_utils_1 left \
    --set separator_utils_1 \
                icon.padding_left=-10 \
                icon.padding_right=$SEPARATOR_WIDTH \
                label.drawing=off \
    --add item battery left \
    --set battery "${battery[@]}" \
    --add item cpu_user left \
    --set cpu_user "${cpu_user[@]}" \
    --add item separator_utils_2 left \
    --set separator_utils_2 \
                icon.padding_left=0 \
                icon.padding_right=$SEPARATOR_WIDTH \
                label.drawing=off \
    --add bracket utils_bracket \
                separator_utils_1 \
                separator_utils_2 \
                cpu_user \
                battery \
    --set utils_bracket \
                background.color=$COLOR_UTILS_LAPTOP_BG \
    --add item utils.separator left \
    --set utils.separator "${utils_separator[@]}" \
    --add item utils.separator2 left \
    --set utils.separator2 "${utils_separator2[@]}"

# ------------------------
# CENTER
# ------------------------

# -- SPOTIFY --

spotify=(
    icon=$ICON_SPOTIFY
    icon.padding_left=14
    icon.padding_right=14
    label.padding_right=14
    label.drawing=off
    label.padding_left=3
    background.color=$COLOR_SPOTIFY_BG
    script="$PLUGIN_DIR/spotify.sh"
)

spotify_separator=(
    icon=$ICON_SEPARATOR_LEFT
    icon.color=$COLOR_SPOTIFY_BG
    background.color=$COLOR_SPOTIFY_SEPARATOR2
    icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0"
    icon.padding_left=0
    icon.padding_right=-12
)

spotify_separator2=(
    icon=$ICON_SEPARATOR_LEFT
    icon.color=$COLOR_SPOTIFY_SEPARATOR2
    background.color=$TRANSPARENT
    icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0"
    icon.padding_left=0
    icon.padding_right=-8
    label.drawing=false
)

$BAR_NAME \
    --add item separator_spotify_1 q \
    --set separator_spotify_1 \
            icon.padding_left=100 \
            icon.padding_right=$SEPARATOR_WIDTH \
    --add event spotify_change $SPOTIFY_EVENT \
    --add item spotify q \
    --set spotify "${spotify[@]}" \
    --subscribe spotify spotify_change mouse.clicked \
    --add item separator_spotify q \
    --set separator_spotify "${spotify_separator[@]}" \
    --add bracket spotify_bracket \
        separator_spotify_1 \
        spotify \
    --set spotify_bracket \
        background.color=$COLOR_SPOTIFY_BG \
    --add item separator_spotify2 q \
    --set separator_spotify2 "${spotify_separator2[@]}" \
    --add item separator_notch e \
    --set separator_notch \
            background.color=$COLOR_SPOTIFY_SEPARATOR2 \
            icon.padding_left=0 \
            icon.padding_right=0 \
    --add item separator_current_space_0 e \
    --set separator_current_space_0 \
            label.drawing=false \
            icon.padding_left=100 \
            icon.padding_right=$SEPARATOR_WIDTH

# -- SPACES --

source $PLUGIN_DIR/spaces.sh

current_space_separator=(
    icon=$ICON_SEPARATOR_RIGHT
    icon.color=$COLOR_SPACE_BG
    background.color=$COLOR_FRONT_APP_BG
    icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0"
    icon.padding_left=0
    icon.padding_right=-12
)

$BAR_NAME \
    --add item separator_current_space_1 e \
    --set separator_current_space_1 \
            icon.padding_left=-4 \
            icon.padding_right=$SEPARATOR_WIDTH \
    --add item current_space.separator e \
    --set current_space.separator "${current_space_separator[@]}" \
    --add bracket current_space_bracket \
              separator_current_space_0 \
              separator_current_space_1 \
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
    --set current_space_bracket \
              background.color=$COLOR_SPACE_BG \
    --add item separator_front_app_1 e \
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
    icon.padding_right=0
    label.drawing=false
)

front_app_separator2=(
    icon=$ICON_SEPARATOR_RIGHT
    icon.color=$COLOR_FRONT_APP_SEPARATOR2
    background.color=$TRANSPARENT
    icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0"
    icon.padding_left=-6
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
    label.drawing=false
    script="$PLUGIN_SHARED_DIR/front_app.sh"
)

front_app_name=(
    icon.drawing=off
    label.color=$COLOR_FRONT_APP_NAME
    background.color=$COLOR_FRONT_APP_NAME_BG
    label.padding_left=5
    label.padding_right=0
    drawing=yes
)

$BAR_NAME \
    --add item front_app e \
    --set front_app "${front_app[@]}" \
    --add item front_app.name e \
    --set front_app.name "${front_app_name[@]}" \
    --add item separator_front_app_2 e \
    --set separator_front_app_2 \
            icon.padding_left=-10 \
            icon.padding_right=$SEPARATOR_WIDTH \
    --add item front_app.separator e \
    --set front_app.separator "${front_app_separator[@]}" \
    --add bracket front_app_bracket \
            front_app \
            front_app.name \
            separator_front_app_2 \
            separator_front_app_1 \
     --set front_app_bracket \
            background.color=$COLOR_FRONT_APP_BG \
    --subscribe front_app front_app_switched mouse.clicked \
    --add item front_app.separator2 e \
    --set front_app.separator2 "${front_app_separator2[@]}"


# $BAR_NAME --add item battery q \
#           --set battery \
#                 update_freq=20 \
#                 icon.padding_left=10 \
#                 label.padding_right=10 \
#                 label.width=44 \
#                 label.color=$COLOR_TEXT_CONTRAST \
#                 icon.color=$COLOR_TEXT_CONTRAST \
#                 script="$PLUGIN_SHARED_DIR/battery.sh"

#$BAR_NAME --add item cpu q \
#           --set cpu  update_freq=5 \
#                      icon.padding_left=10 \
#                      label.padding_right=10 \
#                      label.width=38 \
#                      icon=􀧓 \
#                      label.color=$COLOR_TEXT_CONTRAST \
#                      icon.color=$COLOR_TEXT_CONTRAST \
#                      script="$PLUGIN_SHARED_DIR/cpu.sh"


# ------------------------
# RIGHT
# ------------------------

# -- CLOCK --

clock=(
    label.color=$COLOR_RIGHT_AREA_TEXT
    background.color=$COLOR_RIGHT_AREA_BG
    update_freq=10
    script="$PLUGIN_SHARED_DIR/time.sh"
)

clock_icon=(
    background.color=$COLOR_RIGHT_AREA_BG
    icon=$ICON_CLOCK
    icon.color=$COLOR_CLOCK
    icon.y_offset=0
    icon.padding_left=10
    icon.padding_right=0
    label.padding_left=0
    label.padding_right=0
)

clock_separator=(
    icon=$ICON_SEPARATOR_LEFT
    icon.color=$COLOR_RIGHT_AREA_BG
    background.color=$COLOR_UTILS_RIGHT_BG
    icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0"
    icon.padding_left=0
    icon.padding_right=-12
)

$BAR_NAME \
    --add item separator_3 right \
    --set separator_3 \
        background.color=$COLOR_RIGHT_AREA_BG \
        icon.padding_right=$SEPARATOR_WIDTH \
    --add item clock_icon right \
    --set clock_icon "${clock_icon[@]}" \
    --add item clock right \
    --set clock "${clock[@]}" \
    --add item clock_separator right \
    --set clock_separator "${clock_separator[@]}"


# -- UTILS RIGHT --

airpods=(
    drawing=false
    update_freq=5
    icon=$ICON_AIRPODS
    icon.color=$COLOR_STATS
    icon.y_offset=0
    icon.padding_left=10
    icon.padding_right=6
    label.padding_left=0
    label.padding_right=10
    label.color=$COLOR_STATS
    script="$PLUGIN_SHARED_DIR/airpods.sh"
)

airpods_case=(
    drawing=false
    update_freq=5
    icon.color=$COLOR_STATS
    icon.padding_left=6
    icon.padding_right=6
    label.padding_left=-5
    label.padding_right=4
    label.color=$COLOR_STATS
    script="$PLUGIN_SHARED_DIR/airpods_case.sh"
)

volume=(
    icon=$ICON_VOLUME
    icon.padding_left=10
    icon.padding_right=6
    label.padding_right=8
    label.padding_left=0
    label.drawing=false
    label.color=$COLOR_UTILS_LAPTOP
    icon.color=$COLOR_UTILS_LAPTOP
    script="$PLUGIN_SHARED_DIR/volume.sh"
)

utils_r_separator=(
    icon=$ICON_SEPARATOR_LEFT
    icon.color=$COLOR_UTILS_RIGHT_BG
    background.color=$COLOR_UTILS_RIGHT_EXTRA_SEPARATOR
    icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0"
    icon.padding_left=0
    icon.padding_right=-12
)

utils_r_separator2=(
    icon=$ICON_SEPARATOR_LEFT
    icon.color=$COLOR_UTILS_RIGHT_EXTRA_SEPARATOR
    background.color=$TRANSPARENT
    icon.font="$FONT_FACE:Bold:$BAR_HEIGHT.0"
    icon.padding_left=0
    icon.padding_right=-8
    label.drawing=false
)

$BAR_NAME \
    --add item separator_utils_r_1 right \
    --set separator_utils_r_1 \
            icon.padding_left=0 \
            icon.padding_right=$SEPARATOR_WIDTH \
    --add item airpods_case right \
    --set airpods_case "${airpods_case[@]}" \
    --add item airpods right \
    --set airpods "${airpods[@]}" \
    --add item volume right \
    --set volume "${volume[@]}" \
    --subscribe volume volume_change \
    --add bracket utils_right \
            separator_utils_r_1 \
            airpods \
            volume \
    --set utils_right \
            background.color=$COLOR_UTILS_RIGHT_BG \
    --add item utils_right.separator right \
    --set utils_right.separator "${utils_r_separator[@]}" \
    --add item utils_right.separator2 right \
    --set utils_right.separator2 "${utils_r_separator2[@]}"


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