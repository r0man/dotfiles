#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Load ~/.xprofile
[[ -f ~/.xprofile ]] && . ~/.xprofile

# start-pulseaudio-x11 &

# Start Emacs.
emacs &

# Start chromium.
chromium &

# Start Window Manager.
dbus-launch --sh-syntax --exit-with-session xmonad
