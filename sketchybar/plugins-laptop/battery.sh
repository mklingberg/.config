#!/bin/bash

COLOR_BATTERY_LOW=0xffee99a0
COLOR_BATTERY_EMPTY=0xffed8796
COLOR_BATTERY_ICON=0xffc7c7c7

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

LABEL_THRESHOLD=50
SHOW_LABEL=false
PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
    exit 0
fi

# Show label if percentage is less than x%
if [ $PERCENTAGE -lt $LABEL_THRESHOLD ]; then
  SHOW_LABEL=true
fi

if [[ $CHARGING != "" ]]; then
    case ${PERCENTAGE} in
    [100])
        ICON=$ICON_BATTERY_CH_V100
        ;;
    [9][0-9])
        ICON=$ICON_BATTERY_CH_V90
        ;;
    [8][0-9])
        ICON=$ICON_BATTERY_CH_V80
        ;;
    [7][0-9])
        ICON=$ICON_BATTERY_CH_V70
        ;;
    [6][0-9])
        ICON=$ICON_BATTERY_CH_V60
        ;;
    [5][0-9])
        ICON=$ICON_BATTERY_CH_V50
        ;;
    [4][0-9])
        ICON=$ICON_BATTERY_CH_V40
        ;;
    [3][0-9])
        ICON=$ICON_BATTERY_CH_V30
        ;;
    [2][0-9])
        ICON=$ICON_BATTERY_CH_V20
        COLOR_BATTERY_ICON=$COLOR_BATTERY_LOW
        ;;
    [1][0-9])
        ICON=$ICON_BATTERY_CH_V10
        COLOR_BATTERY_ICON=$COLOR_BATTERY_LOW
        ;;
    [0-9])
        ICON=$ICON_BATTERY_CH_V0
        COLOR_BATTERY_ICON=$COLOR_BATTERY_EMPTY
        ;;
    esac
else
    case ${PERCENTAGE} in
    [100])
        ICON=$ICON_BATTERY_V100
        ;;
    [9][0-9])
        ICON=$ICON_BATTERY_V90
        ;;
    [8][0-9])
        ICON=$ICON_BATTERY_V80
        ;;
    [7][0-9])
        ICON=$ICON_BATTERY_V70
        ;;
    [6][0-9])
        ICON=$ICON_BATTERY_V60
        ;;
    [5][0-9])
        ICON=$ICON_BATTERY_V50
        ;;
    [4][0-9])
        ICON=$ICON_BATTERY_V40
        ;;
    [3][0-9])
        ICON=$ICON_BATTERY_V30
        ;;
    [2][0-9])
        ICON=$ICON_BATTERY_V20
        COLOR_BATTERY_ICON=$COLOR_BATTERY_LOW
        ;;
    [1][0-9])
        ICON=$ICON_BATTERY_V10
        COLOR_BATTERY_ICON=$COLOR_BATTERY_LOW
        ;;
    [0-9])
        ICON=$ICON_BATTERY_V0
        COLOR_BATTERY_ICON=$COLOR_BATTERY_EMPTY
        ;;
    esac
fi

$BAR_NAME --set $NAME \
    icon=$ICON \
    label="${PERCENTAGE}%" \
    label.drawing=$SHOW_LABEL \
    icon.color=$COLOR_BATTERY_ICON \
    label.color=$COLOR_BATTERY_ICON
