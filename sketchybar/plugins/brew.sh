#!/bin/bash

COLOR_BREW_OUTDATED=0xffed8796
COLOR_BREW_HIGH=0xfff5a97f
COLOR_BREW_MEDIUM=0xffeed49f
COLOR_BREW_LOW=0xffcad3f5
COLOR_BREW_UPDATED=0xffa6da95

source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors
source "$HOME/.config/sketchybar/icons.sh" # Loads all defined colors

COUNT="$(brew outdated | wc -l | tr -d ' ')"

COLOR=$COLOR_BREW_OUTDATED

case "$COUNT" in
  [3-5][0-9]) COLOR=$COLOR_BREW_HIGH
  ;;
  [1-2][0-9]) COLOR=$COLOR_BREW_MEDIUM
  ;;
  [1-9]) COLOR=$COLOR_BREW_LOW
  ;;
  0) COLOR=$COLOR_BREW_UPDATED
     COUNT=$ICON_BREW_UPDATED
  ;;
esac

$BAR_NAME --set $NAME label=$COUNT icon.color=$COLOR label.color=$COLOR
