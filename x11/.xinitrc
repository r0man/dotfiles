#!/usr/bin/env bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Load ~/.xprofile
[[ -f ~/.xprofile ]] && . ~/.xprofile

# Start Emacs.
emacs &

# Start chromium.
chromium &

# Start Window Manager.
dbus-launch --exit-with-session xmonad
