#!/bin/bash

# -- GLOBAL --
export TRANSPARENT=0x00000000
export COLOR_WHITE=0xffffffff
export COLOR_BLACK=0xff000000
export COLOR_WARNING=0xffff0000

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

COLOR_DARCULA_APPLE=0xff080808
COLOR_DRACULA_YELLOW=0xfff1fa8c #Yellow
#COLOR_DRACULA_YELLOW=0xffffb86c #Orange
COLOR_DRACULA_PURPLE=0xffbd93f9
COLOR_DRACULA_BLACK=0xff20212a
COLOR_DRACULA_BLACK_TEXT_LIGHT=0x5520212a
COLOR_DRACULA_LIGHT_BG=0xfff8f8f2
COLOR_DRACULA_TEXT_DARK_BG=0xccf8f8f2
COLOR_DRACULA_VAN_HELSING=0xff5bf5f5
COLOR_DRACULA_BLADE=0xff64f859
COLOR_DRACULA_LINCOLN=0xfff8f859
COLOR_DRACULA_MORBIUS=0xfff87359
COLOR_DRACULA_BUFFY=0xfff859a8
COLOR_DRACULA_PRO=0xff7458f8

export COLOR_DATE=0xffed8796

export COLOR_TEXT=0xff24273a
export COLOR_BAR=0x66494d64
export COLOR_TEXT_CONTRAST=0xffc7c7c7
#export COLOR_ACCENT=0xfff1fa8c # yellow
export COLOR_ACCENT=0xffbd93f9 # purple
export COLOR_SECONDARY=0xff21222c
export COLOR_TERTIARY=0xfff8f8f2 

COLOR_WARNING=$COLOR_DRACULA_MORBIUS


# RELOAD
COLOR_RELOAD_ENTERED=$COLOR_DRACULA_BLACK
COLOR_RELOAD_ICON=$COLOR_DRACULA_BLACK
COLOR_RELOAD_BG=$COLOR_DRACULA_LIGHT_BG
COLOR_RELOAD_EXITED=$COLOR_DRACULA_BLACK

# CURRENT SPACE
COLOR_CURRENT_SPACE_BG=$COLOR_DRACULA_VAN_HELSING
COLOR_CURRENT_SPACE_TEXT=$COLOR_TEXT

# SPACES
COLOR_SPACE_SELECTED_BG=$COLOR_DRACULA_VAN_HELSING
COLOR_SPACE_SELECTED_SPACE_NO=$COLOR_BLACK
COLOR_SPACE_SELECTED_ICON=$COLOR_BLACK

COLOR_SPACE_BG=$COLOR_DRACULA_VAN_HELSING
COLOR_SPACE_SPACE_NO=$COLOR_DRACULA_BLACK_TEXT_LIGHT
COLOR_SPACE_ICON=$COLOR_DRACULA_BLACK_TEXT_LIGHT

# FRONT APP ICON
COLOR_FRONT_APP_BG=$COLOR_DRACULA_BUFFY
COLOR_FRONT_APP_ICON=$COLOR_TEXT
COLOR_FRONT_APP_NAME=$COLOR_TEXT

# SPOTIFY
COLOR_SPOTIFY=$COLOR_TEXT
COLOR_SPOTIFY_PAUSE=$COLOR_TEXT
COLOR_SPOTIFY_BG=$COLOR_DRACULA_PURPLE

# STATS
COLOR_STATS_BG=$COLOR_DRACULA_BLACK
COLOR_STATS=$COLOR_DRACULA_TEXT_DARK_BG
COLOR_BATTERY_ICON=$COLOR_DRACULA_TEXT_DARK_BG

# RIGHT_AREA
COLOR_RIGHT_AREA_BG=$COLOR_DRACULA_BLACK
COLOR_RIGHT_AREA_TEXT=$COLOR_DRACULA_TEXT_DARK_BG

# CPU
COLOR_CPU_LOW=$COLOR_STATS
COLOR_CPU_MEDIUM=$COLOR_DRACULA_LINCOLN
COLOR_CPU_HIGH=$COLOR_DRACULA_MORBIUS

# VOLUME
COLOR_VOLUME_LOW=$COLOR_STATS
COLOR_VOLUME_MEDIUM=$COLOR_DRACULA_LINCOLN
COLOR_VOLUME_HIGH=$COLOR_DRACULA_MORBIUS

# BATTERY
COLOR_BATTERY_LOW=$COLOR_DRACULA_LINCOLN
COLOR_BATTERY_EMPTY=$COLOR_DRACULA_MORBIUS
COLOR_BATTERY_ICON=$COLOR_STATS


# -- Teal Scheme --
#export COLOR_ACCENT=0xff2cf9ed
#export COLOR_SECONDARY=0xff003547
#export COLOR_TEXT_CONTRAST=0xffc7c7c7
#export COLOR_BAR=0xff001f30
#export ITEM_BG_COLOR=0xff003547
#export COLOR_ACCENT=0xff2cf9ed
#export COLOR_TEXT=0xff24273a

# -- Gray Scheme --
# export COLOR_BAR=0xff101314
# export ITEM_BG_COLOR=0xff353c3f
# export COLOR_ACCENT=0xffffffff

# -- Purple Scheme --
# export COLOR_BAR=0xff140c42
# export ITEM_BG_COLOR=0xff2b1c84
# export COLOR_ACCENT=0xffeb46f9

# -- Red Scheme ---
# export COLOR_BAR=0xff23090e
# export ITEM_BG_COLOR=0xff591221
# export COLOR_ACCENT=0xffff2453

# -- Blue Scheme --- 
# export COLOR_BAR=0xff021254
# export ITEM_BG_COLOR=0xff093aa8
# export COLOR_ACCENT=0xff15bdf9

# -- Green Scheme --
# export COLOR_BAR=0xff003315
# export ITEM_BG_COLOR=0xff008c39
# export COLOR_ACCENT=0xff1dfca1


# -- Orange Scheme --
# export COLOR_BAR=0xff381c02
# export ITEM_BG_COLOR=0xff99440a
# export COLOR_ACCENT=0xfff97716

# -- Yellow Scheme --
# export COLOR_BAR=0xff2d2b02
# export ITEM_BG_COLOR=0xff8e7e0a
# export COLOR_ACCENT=0xfff7fc17