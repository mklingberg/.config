#!/bin/bash

COLOR_BATTERY_LOW=0xffee99a0
COLOR_BATTERY_EMPTY=0xffed8796
COLOR_BATTERY_ICON=0xffc7c7c7

source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors

SHOW_LABEL=true
PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
    exit 0
fi

case ${PERCENTAGE} in
[8-9][0-9] | 100)
    ICON=""
    ;;
7[0-9])
    ICON=""
    ;;
[4-6][0-9])
    ICON=""
    ;;
[1-3][0-9])
    ICON=""
    COLOR_BATTERY_ICON=$COLOR_BATTERY_LOW
    ;;
[0-9])
    ICON=""
    COLOR_BATTERY_ICON=$COLOR_BATTERY_EMPTY
    ;;
esac

case ${PERCENTAGE} in
    100)
    SHOW_LABEL=false
    ;;
[1-3][0-9])
    SHOW_LABEL=true
    ;;
[0-9])
    SHOW_LABEL=true
    ;;
esac

if [[ $CHARGING != "" ]]; then
    ICON=""
fi

$BAR_NAME --set $NAME \
    icon=$ICON \
    label="${PERCENTAGE}%" \
    label.drawing=$SHOW_LABEL \
    icon.color=$COLOR_BATTERY_ICON \
    label.color=$COLOR_BATTERY_ICON
