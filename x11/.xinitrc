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

# Start Gnome
#exec gnome-session

# Start XMonad
#dbus-launch --sh-syntax --exit-with-session xmonad

# Start StumpWM
dbus-launch sbcl --load /home/roman/bin/start-stumpwm
