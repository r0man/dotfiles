#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Load ~/.xprofile
[[ -f ~/.xprofile ]] && . ~/.xprofile

# Start Emacs in urxvt terminal.
urxvt -e emacs -nw &

# Start chromium.
chromium &

# Start Window Manager.
exec xmonad
#exec gnome-session --session=xmonad
