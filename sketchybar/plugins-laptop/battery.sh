#!/usr/bin/env sh
source "$CONFIG_DIR/colors.sh" # Loads all defined colors
# Battery is here bcause the ICON_COLOR doesn't play well with all background colors

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
    exit 0
fi

case ${PERCENTAGE} in
[8-9][0-9] | 100)
    ICON=""
    ICON_COLOR=$TEXT_COLOR
    ;;
7[0-9])
    ICON=""
    ICON_COLOR=$TEXT_COLOR
    ;;
[4-6][0-9])
    ICON=""
    ICON_COLOR=$SECONDARY_COLOR
    ;;
[1-3][0-9])
    ICON=""
    ICON_COLOR=0xffee99a0
    ;;
[0-9])
    ICON=""
    ICON_COLOR=0xffed8796
    ;;
esac

if [[ $CHARGING != "" ]]; then
    ICON=""
    ICON_COLOR=$TEXT_COLOR
fi

sketchybar --set $NAME \
    icon=$ICON \
    label="${PERCENTAGE}%" \
    icon.color=${ICON_COLOR}
