# .config

## Aerospace
Using Aerospace as window manager integration with sketchybar to show active/inactive workspaces and application windows.

## Sketchybar
Configuration for sketchybar that integrates with yabai. Two bar layouts, desktop and laptop. Desktop to be used with external displays and laptop as the main MacBook display.

## Borders
Running borders as a standalone service `brew services start borders`.

## Adding a secondary bar

Use the command `ln -s $(which sketchybar) $(dirname $(which sketchybar))/sketchybar-2` to add a secondary bar for external screen.
The main bar is set to be shown on the main screen and the laptop screen should be assigned `main display` with this config.

## Zsh
Create links to config folder

`ln -s ~/.config/zsh/zshrc ~/.zshrc`
`ln -s ~/.config/wezterm/wezterm.lua ~/.wezterm.lua`

### Dracula Zsh

https://draculatheme.com/zsh
https://github.com/dracula/powerlevel10k
