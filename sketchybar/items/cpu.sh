#!/bin/bash

$BAR_NAME --add item cpu q \
           --set cpu  update_freq=5 \
                      icon.padding_left=10 \
                      label.padding_right=10 \
                      icon=􀧓 \
                      script="$PLUGIN_SHARED_DIR/cpu.sh"