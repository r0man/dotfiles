#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Load X resources.
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Use a better mouse pointer.
xsetroot -cursor_name left_ptr

# Use the German keyboard layout.
setxkbmap -layout de

# Use the CAPS-LOCK key as an additional control.
setxkbmap -option "ctrl:nocaps"

# Enable X restart.
setxkbmap -option terminate:ctrl_alt_bksp

# Fix less/greater than keys.
xmodmap ~/.xmodmaprc

# Set wallpaper.
feh --bg-scale ~/.xmonad/wallpapers/stop-customizing-start-working.jpg

# Start Music Player Daemon.
mpd &

# Hide mouse cursor when idle.
unclutter -idle 5 -noevents &

# Start the screensaver
xscreensaver -no-splash &

# Start xbindkeys - a grabbing keys program for X.
xbindkeys

# Start Emacs.
emacs &

# Start chromium.
chromium &

# Start Window Manager.
exec xmonad
