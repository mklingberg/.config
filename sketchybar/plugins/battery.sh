#!/bin/bash

COLOR_BATTERY_LOW=0xffee99a0
COLOR_BATTERY_EMPTY=0xffed8796

source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors

# Battery is here bcause the ICON_COLOR doesn't play well with all background colors
ICON_COLOR=$COLOR_TEXT_CONTRAST

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
    ICON_COLOR=$COLOR_SECONDARY
    ;;
[1-3][0-9])
    ICON=""
    ICON_COLOR=$COLOR_BATTERY_LOW
    ;;
[0-9])
    ICON=""
    ICON_COLOR=$COLOR_BATTERY_EMPTY
    ;;
esac

if [[ $CHARGING != "" ]]; then
    ICON=""
fi

$BAR_NAME --set $NAME \
    icon=$ICON \
    label="${PERCENTAGE}%" \
    icon.color=${ICON_COLOR}
