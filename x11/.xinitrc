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

export COLOR_PROFILE="$HOME/.color-profiles/color-lcd-46fa2088-5175-1712-04a4-8183272cf248.icc"
if [ -f $COLOR_PROFILE ]; then
    xcalib $COLOR_PROFILE
    echo "Loaded color profile."
fi

# Load ~/.xprofile
[[ -f ~/.xprofile ]] && . ~/.xprofile

# start-pulseaudio-x11 &

# Start composite window manager
compton &

# Start Gnome
#exec gnome-session

# Start XMonad
#dbus-launch --sh-syntax --exit-with-session xmonad

# Start StumpWM
dbus-launch sbcl --load /home/roman/bin/start-stumpwm
