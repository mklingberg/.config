#!/bin/bash

# -- GLOBAL --
export TRANSPARENT=0x00000000
export COLOR_WHITE=0xffffffff
export COLOR_BLACK=0xff000000
export COLOR_WARNING=0xffff5555

# -- DEFAULT --

#export TRANSPARENT=0x00000000
#export COLOR_WHITE=0xffffffff
#export COLOR_BLACK=0xff000000
#export COLOR_DATE=0xffed8796

#export COLOR_TEXT=0xff24273a
#export COLOR_BAR=0x66494d64
#export COLOR_TEXT_CONTRAST=0xffeeeeee
#export COLOR_ACCENT=0xffa6da95
#export COLOR_SECONDARY=0xfff5a97f
#export COLOR_TERTIARY=0xffed8796

# -- DRACULA --

export COLOR_DARCULA_APPLE=0xff080808
export COLOR_DRACULA_YELLOW=0xfff1fa8c #Yellow
#COLOR_DRACULA_YELLOW=0xffffb86c #Orange
export COLOR_DRACULA_PURPLE=0xffbd93f9
export COLOR_DRACULA_BLACK=0xff20212a
export COLOR_DRACULA_BLACK_TEXT_LIGHT=0x6620212a
export COLOR_DRACULA_LIGHT_BG=0xfff8f8f2
export COLOR_DRACULA_TEXT_DARK_BG=0xfff8f8f2
export COLOR_DRACULA_TEXT_DARK_BG_LIGHT=0x88f8f8f2
export COLOR_DRACULA_VAN_HELSING=0xff5bf5f5
export COLOR_DRACULA_BLADE=0xff64f859
export COLOR_DRACULA_LINCOLN=0xfff8f859
export COLOR_DRACULA_MORBIUS=0xfff8735a
export COLOR_DRACULA_BUFFY=0xfff859a8
export COLOR_DRACULA_PRO=0xff7458f8
export COLOR_DRACULA_ORANGE=0xfff8b659 # for warning?
export COLOR_DRACULA_RED_1=0xffff5252  # for error?
export COLOR_DRACULA_DARK_BLUE=0xff3f718c
export COLOR_DRACULA_GREEN_1=0xff71d385
export COLOR_DRACULA_YELLOW_1=0xfff5c02c
export COLOR_DRACULA_MAGENTA_1=0xff34b5c6
export COLOR_DRACULA_DARK_GRAY=0xff424350
export COLOR_DRACULA_LIGHT_GRAY=0xffcccccc
export COLOR_DRACULA_WARNING=0xffff6e67
export COLOR_DRACULA_GREY=0xff353746
export COLOR_DRACULA_MIDDLE_GREY=0xff414450

COLOR_LIGHT_GREY=0xffbbbbbb

export COLOR_DATE=0xffed8796

export COLOR_TEXT=0xff24273a
export COLOR_BAR=0x66494d64
export COLOR_TEXT_CONTRAST=0xffc7c7c7
#export COLOR_ACCENT=0xfff1fa8c # yellow
export COLOR_ACCENT=0xffbd93f9 # purple
export COLOR_SECONDARY=0xff21222c
export COLOR_TERTIARY=0xfff8f8f2 

#COLOR_WARNING=$COLOR_DRACULA_MORBIUS


COLOR_DRACULA_CUSTOM_YELLOW=0xfff1fa8c

# STATS
export COLOR_STATS_BG=$COLOR_DRACULA_BLACK
export COLOR_STATS=$COLOR_DRACULA_TEXT_DARK_BG
export COLOR_BATTERY_ICON=$COLOR_DRACULA_BLACK

# APPLE / SCREEN NO.
export COLOR_RELOAD_ENTERED=$COLOR_DRACULA_BLACK
export COLOR_RELOAD_ICON=$COLOR_DRACULA_BLACK
export COLOR_RELOAD_BG=$COLOR_DRACULA_LIGHT_BG
export COLOR_RELOAD_EXITED=$COLOR_DRACULA_BLACK

# CPU
export COLOR_CPU_LOW=$COLOR_STATS
export COLOR_CPU_MEDIUM=$COLOR_DRACULA_LINCOLN
export COLOR_CPU_HIGH=$COLOR_WARNING

# BATTERY
export COLOR_BATTERY_LOW=$COLOR_DRACULA_LINCOLN
export COLOR_BATTERY_EMPTY=$COLOR_WARNING
export COLOR_BATTERY_ICON=$COLOR_STATS

# BREW
export COLOR_BREW_HIGH=$COLOR_DRACULA_LINCOLN
export COLOR_BREW_MEDIUM=$COLOR_DRACULA_MORBIUS
export COLOR_BREW_LOW=$COLOR_STATS
export COLOR_BREW_UPDATED=$COLOR_STATS
export COLOR_BREW_OUTDATED=$COLOR_DRACULA_PRO

# CURRENT SPACE
export COLOR_CURRENT_SPACE_BG=$COLOR_DRACULA_LINCOLN
export COLOR_CURRENT_SPACE_TEXT=$COLOR_TEXT

# SPACES
export COLOR_SPACE_SELECTED_SPACE_NO=0xfff8f8f2
export COLOR_SPACE_SELECTED_ICON=0xfff8f8f2
export COLOR_SPACE_SELECTED_BG=0x22000000

export COLOR_SPACE_BG=$COLOR_DRACULA_MORBIUS
export COLOR_SPACE_ICON=$COLOR_DRACULA_DARK_GRAY
export COLOR_SPACE_SPACE_NO=$COLOR_DRACULA_DARK_GRAY

# SPOTIFY
export COLOR_SPOTIFY=$COLOR_DRACULA_TEXT_DARK_BG
export COLOR_SPOTIFY_ICON=$COLOR_DRACULA_BLADE
export COLOR_SPOTIFY_PAUSE=$COLOR_DRACULA_TEXT_DARK_BG
export COLOR_SPOTIFY_BG=$COLOR_DRACULA_BLACK
export COLOR_SPOTIFY_SEPARATOR2=$COLOR_DRACULA_DARK_GRAY

# FRONT APP
export COLOR_FRONT_APP_BG=$COLOR_DRACULA_BLACK
export COLOR_FRONT_APP_ICON=$COLOR_DRACULA_BLADE
export COLOR_FRONT_APP_NAME=$COLOR_DRACULA_TEXT_DARK_BG
export COLOR_FRONT_APP_NAME_BG=$COLOR_DRACULA_BLACK
export COLOR_FRONT_APP_SEPARATOR2=$COLOR_DRACULA_DARK_GRAY

# RIGHT_AREA
export COLOR_RIGHT_AREA_BG=$COLOR_LIGHT_GREY
export COLOR_RIGHT_AREA_TEXT=$COLOR_SECONDARY
export COLOR_RIGHT_EXTRA_SEPARATOR=$COLOR_DRACULA_LIGHT_GRAY

# DATE
export COLOR_DATE_BG=$COLOR_DRACULA_MIDDLE_GREY
export COLOR_DATE_TEXT=$COLOR_DRACULA_TEXT_DARK_BG

# ICON_CLOCK
export COLOR_CLOCK=$COLOR_SECONDARY

# VOLUME
export COLOR_VOLUME_TEXT=$COLOR_DRACULA_BLADE_FADED  #$COLOR_LIGHT_GREY
export COLOR_VOLUME_LOW=$COLOR_DRACULA_BLADE
export COLOR_VOLUME_MEDIUM=$COLOR_DRACULA_LINCOLN
export COLOR_VOLUME_HIGH=$COLOR_WARNING

# UTILS
export COLOR_UTILS_BG=$COLOR_DRACULA_PURPLE
export COLOR_UTILS_LAPTOP_BG=$COLOR_DRACULA_PURPLE
export COLOR_UTILS_SEPARATOR2=0xff8e5ebc

# UTILS RIGHT
export COLOR_UTILS_RIGHT_BG=$COLOR_DRACULA_BLACK
export COLOR_UTILS_RIGHT_SEPARATOR2=$COLOR_DRACULA_BLACK
export COLOR_UTILS_RIGHT_EXTRA_SEPARATOR=$COLOR_DRACULA_DARK_GRAY

# AIRPODS
export COLOR_HEADPHONES_WARNING=$COLOR_DRACULA_LINCOLN
export COLOR_HEADPHONES_CRITICAL=$COLOR_WARNING
export COLOR_HEADPHONES=$COLOR_DRACULA_BLADE

# AIRPODS CASE
export COLOR_HEADPHONES_CASE_WARNING=$COLOR_DRACULA_LINCOLN
export COLOR_HEADPHONES_CASE_CRITICAL=$COLOR_WARNING
export COLOR_HEADPHONES_CASE=$COLOR_DRACULA_BLADE