#!/usr/bin/env bash

DOT_FILES="$HOME/.dotfiles"

function install () {
    echo "Installing $1 to $2 ..."
    mkdir -p $(dirname $2)
    rm -f $2
    ln -s $DOT_FILES/$1 $2
}

install .Xresources ~/.Xresources
install .bash_aliases ~/.bash_aliases
install .bash_profile ~/.bash_profile
install .bashrc ~/.bashrc
install .gemrc ~/.gemrc
install .mpdconf ~/.mpdconf
install .wgetrc ~/.wgetrc
install .xbindkeysrc ~/.xbindkeysrc
install .xinitrc ~/.xinitrc
install .xmodmaprc ~/.xmodmaprc

# LEININGEN
install bin/lein ~/bin/lein

# PAKTAHN
install .paktahn/config.lisp ~/.paktahn/config.lisp

# XPROP FOR XMONAD
install bin/xprop-xmonad ~/bin/xprop-xmonad
