#!/bin/bash

SHOW_LABEL=true

case ${INFO} in
0)
    ICON="󰖁"
    ICON_PADDING_RIGHT=10
    SHOW_LABEL=false
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

$BAR_NAME --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT label="$INFO%" label.drawing=$SHOW_LABEL