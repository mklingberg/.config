#!/bin/bash

# Trigger the brew_udpate event when brew update or upgrade is run from cmdline
# e.g. via function in .zshrc

brew=(
  icon=􀐛
  label=?
  padding_right=10
  script="$PLUGIN_SHARED_DIR/brew.sh"
)

$BAR_NAME \
    --add event brew_update \
    --add item brew right   \
    --set brew "${brew[@]}" \
    --subscribe brew brew_update

