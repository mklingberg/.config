#!/bin/bash

COLOR_BREW_OUTDATED=0xffed8796
COLOR_BREW_HIGH=0xfff5a97f
COLOR_BREW_MEDIUM=0xffeed49f
COLOR_BREW_LOW=0xffcad3f5
COLOR_BREW_UPDATED=0xffa6da95

source "$HOME/.config/$BAR_NAME/theme.sh"
source "$HOME/.config/sketchybar/utils.sh"

# Capture the output of brew outdated
BREW_OUTDATED_OUTPUT=$(brew outdated)

if [ -z "$BREW_OUTDATED_OUTPUT" ]; then
  exit 0
fi

#COUNT=$(echo "$BREW_OUTDATED_OUTPUT" | wc -l | awk '{print $1}')

# Remove lines starting with "==>" and count the remaining lines
COUNT=$(echo "$BREW_OUTDATED_OUTPUT" | grep -v '^==>' | wc -l | awk '{print $1}')

# Log the output for debugging
echo "BREW_OUTDATED_OUTPUT: $BREW_OUTDATED_OUTPUT"
echo "COUNT: $COUNT"

# If there was an error getting outdated packages, exit
# just showing previous value
if [ -z "$COUNT" ]; then
  exit 0
fi

COLOR=$COLOR_BREW_OUTDATED
SHOW_LABEL=true

ICON=$ICON_BREW

if [ $COUNT -eq 0 ]; then
  COLOR=$COLOR_BREW_UPDATED
  ICON=$ICON_BREW_UPDATED
  SHOW_LABEL=false
elif [ $COUNT -lt 10 ]; then
  COLOR=$COLOR_BREW_LOW
elif [ $COUNT -lt 20 ]; then
  COLOR=$COLOR_BREW_MEDIUM
else
  COLOR=$COLOR_BREW_HIGH
fi

LABEL_COLOR=$(fade_color $COLOR)

$BAR_NAME --set $NAME label=$COUNT icon=$ICON label.drawing=$SHOW_LABEL icon.color=$COLOR label.color=$LABEL_COLOR
