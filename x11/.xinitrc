#!/usr/bin/env bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Load ~/.xprofile
[[ -f ~/.xprofile ]] && . ~/.xprofile

#Start Pulse Audio.
start-pulseaudio-x11

# Start Emacs.
emacs &

# Start chromium.
chromium &

# Start Window Manager.
exec xmonad
#exec gnome-session --session=xmonad
