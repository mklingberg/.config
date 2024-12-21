#!/bin/bash

COLOR_BREW_OUTDATED=0xffed8796
COLOR_BREW_HIGH=0xfff5a97f
COLOR_BREW_MEDIUM=0xffeed49f
COLOR_BREW_LOW=0xffcad3f5
COLOR_BREW_UPDATED=0xffa6da95

source "$HOME/.config/$BAR_NAME/theme.sh"
source "$HOME/.config/sketchybar/utils.sh"

COUNT="$(brew outdated | wc -l | tr -d ' ')"

# If there was an error getting outdated packages, exit
# just showing previous value
if [ -z "$COUNT" ]; then
  exit 0
fi

COLOR=$COLOR_BREW_OUTDATED
SHOW_LABEL=true

ICON=$ICON_BREW

case "$COUNT" in
  [3-5][0-9]) COLOR=$COLOR_BREW_HIGH
  ;;
  [1-2][0-9]) COLOR=$COLOR_BREW_MEDIUM
  ;;
  [1-9]) COLOR=$COLOR_BREW_LOW
  #;;
  #[1-4]) COLOR=$COLOR_BREW_UPDATED
  ;;
  0) COLOR=$COLOR_BREW_UPDATED
     COUNT=$ICON_BREW_UPDATED
     SHOW_LABEL=false
     ICON=$ICON_BREW_UPDATED
  ;;
esac

LABEL_COLOR=$(fade_color $COLOR)

$BAR_NAME --set $NAME label=$COUNT icon=$ICON label.drawing=$SHOW_LABEL icon.color=$COLOR label.color=$LABEL_COLOR
