#!/bin/bash

SHOW_LABEL=true
ICON_PADDING_RIGHT=10

case ${INFO} in
0)
    ICON="󰖁"
    SHOW_LABEL=false
    ;;
[1-9]|[1-3][0-9])
    ICON="󰖀"
    SHOW_LABEL=false
    ;;
[4-6][0-9])
    ICON="󰕾"
    SHOW_LABEL=false
    ;;
[7-9][0-9]|100)
    ICON=""
    ;;
esac

$BAR_NAME --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT label="$INFO%" label.drawing=$SHOW_LABEL