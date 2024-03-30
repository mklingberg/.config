#!/usr/bin/env zsh

case ${INFO} in
0)
    ICON="󰖁"
    ICON_PADDING_RIGHT=10
    ;;
[1-9]|[1-2][0-9])
    ICON="󰖀"
    ICON_PADDING_RIGHT=10
    ;;
[3-5][0-9])
    ICON="󰕾"
    ICON_PADDING_RIGHT=10
    ;;
[6-9][0-9]|100)
    ICON=""
    ICON_PADDING_RIGHT=10
    ;;
esac

sketchybar --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT label="$INFO%"