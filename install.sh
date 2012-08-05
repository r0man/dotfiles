#!/usr/bin/env bash

DOT_FILES="$HOME/.dotfiles"

function install () {
    echo "Installing $1 ..."
    mkdir -p $(dirname $1)
    rm -f $HOME/$1
    ln -s $DOT_FILES/$1 $HOME/$1
}

install .Xresources
install .bash_aliases
install .bash_profile
install .bashrc
install .mpdconf
install .wgetrc
install .xbindkeysrc
install .xinitrc
install .xmodmaprc

# PAKTAHN
install .paktahn/config.lisp ~/.paktahn/config.lisp
