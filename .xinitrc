#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Load X resources.
xrdb -merge ~/.Xresources

# Use a better mouse pointer.
xsetroot -cursor_name left_ptr

# Use the German keyboard layout.
setxkbmap -layout de

# Use the CAPS-LOCK key as an additional control.
setxkbmap -option "ctrl:nocaps"

# Set wallpaper.
feh --bg-scale ~/.wallpaper/stop-cutomizing-start-working.jpg

# Hide mouse cursor when idle.
unclutter -idle 5 -noevents &

# Start Window Manager.
exec ck-launch-session xmonad

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
