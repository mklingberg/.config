# .config

## Yabai & Skhd
Using tiling window manager yabai and skhd for additional, customizable keyboard shortcuts.

## Sketchybar
Configuration for sketchybar that integrates with yabai. Two bar layouts, desktop and laptop. Desktop to be used with external displays and laptop as the main MacBook display.

## Adding a secondary bar

Use the command `ln -s $(which sketchybar) $(dirname $(which sketchybar))/desktop_bar` to add a secondary bar for external screen.
The main bar is set to be shown on the main screen and the laptop screen should be assigned `main display` with this config.