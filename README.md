# .config

Welcome to my `.config` folder. This repository contains the configuration files that power my customized setup. Let's explore the components that make my system efficient and visually appealing.

## Aerospace
Aerospace is my window manager of choice, seamlessly integrating with SketchyBar to display active and inactive workspaces and application windows. It provides a streamlined and organized desktop experience.

## JankyBorders
JankyBorders adds a touch of elegance to my windows by providing borders. It runs as a standalone service, ensuring that every window is neatly framed.

```bash
brew services start jankyborders
```

## SketchyBar
SketchyBar is a key component of my setup, offering a sleek and customizable bar for my desktop. I have configured two layouts: one for use with external displays (desktop) and one for the MacBook's built-in display (laptop).

### Adding a Secondary Bar
To add a secondary bar for an external screen, use the following command:
```bash
ln -s $(which sketchybar) $(dirname $(which sketchybar))/sketchybar-2
```

## Starship
Starship is my terminal prompt of choice. It is fast, highly customizable, and enhances the terminal experience.

## Terminal
Using Ghostty configured with the Starship prompt and plugins from oh-my-zsh. This combination provides a powerful and efficient terminal environment.

Wezterm & custom config location:
```bash
ln -s ~/.config/wezterm/wezterm.lua ~/.wezterm.lua
```

## Zsh
Zsh is my shell, and I have linked it to my config folder. To set it up, run the following command:
```bash
ln -s ~/.config/zsh/zshrc ~/.zshrc
```
This setup ensures a consistent and optimized shell experience.

## BetterTouchTool
BetterTouchTool is used for custom touchpad and mouse gestures, enhancing productivity and ease of use.

## BetterMouse
BetterMouse provides enhanced functionality and customizations with logi kbd & mouse, improving overall usability.


## VSCode
Moving vscode settings to .config/vscode folder for version management.

```bash
ln -s ~/.config/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
ln -s ~/.config/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
```
### Dracula Zsh
I am using the Dracula theme for Zsh to provide a visually appealing terminal interface.
https://draculatheme.com/zsh

- ReadMe generated by CoPilot :)