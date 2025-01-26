#!/bin/bash

# Homebrew
## Install
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

## Formulae
echo "Installing Brew Formulae..."

### Essentials
brew install gsl
brew install wget
brew install jq
brew install skhd
brew install sketchybar
brew install borders
brew install yabai
brew install gettext
brew install oh-my-posh
brew install libyaml

### Development
brew install kubeseal
brew install openssl@3
brew install ca-certificates
brew install azure-cli
#brew install sqlite

## Casks

### Utilities
brew install --cask betterdisplay
brew install --cask bettertouchtool
brew install --cask bettermouse
brew install --cask cheatsheet

### Terminals
#brew install --cask iterm2
#brew install --cask warp
brew install --cask wezterm

### Communication
brew install --cask slack
brew install --cask microsoft-teams

### Web
brew install --cask arc
brew install --cask google-chrome
brew install --cask firefox

brew install --cask raycast
brew install --cask spotify

### Fonts
brew install --cask sf-symbols
brew install --cask font-sf-mono
brew install --cask font-sf-pro
brew install --cask font-hack-nerd-font
brew install --cask font-jetbrains-mono
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-fira-code
brew install --cask font-fira-code-nerd-font

### Development

brew install --cask dotnet-sdk
#brew install --cask dotnet-sdk5
#brew install --cask dotnet-sdk6
brew install --cask dotnet-sdk7
brew install --cask dotnet-sdk8
brew install --cask ngrok
brew install --cask postman
brew install --cask rider
brew install --cask visual-studio-code
brew install --cask docker
brew install --cask powershell
brew install --cask azure-data-studio
brew install --cask microsoft-azure-storage-explorer
brew install --cask gitcredentialmanager
brew install --cask github


# macOS Settings
echo "Changing macOS defaults..."

defaults write com.apple.spaces spans-displays -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0; killall Dock

defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain _HIHideMenuBar -bool true

defaults write com.apple.screencapture location -string "$HOME/Desktop"
defaults write com.apple.screencapture type -string "png"

defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.Finder AppleShowAllFiles -bool true

defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# When NSWindowShouldDragOnGesture is set to YES, it allows you to drag windows using a three-finger drag gesture on the trackpad
defaults write -g NSWindowShouldDragOnGesture YES

# Installing Fonts
git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
rm -rf /tmp/SFMono_Nerd_Font/

curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.28/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

# Create links to use .config
ln -s ~/.config/zsh/zshrc ~/.zshrc
ln -s ~/.config/wezterm/wezterm.lua ~/.wezterm.lua
ln -s ~/.config/zsh/p10k.zsh ~/.p10k.zsh

# Start Services
echo "Starting Services (grant permissions)..."
brew services start skhd
brew services start yabai
brew services start sketchybar
brew services start borders

#csrutil status
#echo "(optional) Disable SIP for advanced yabai features."
#echo "(optional) Add sudoer manually:\n '$(whoami) ALL = (root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | awk "{print \$1;}") $(which yabai) --load-sa' to '/private/etc/sudoers.d/yabai'"
#echo "Installation complete...\n"