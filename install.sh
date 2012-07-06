#!/usr/bin/env bash

DOT_FILES="~/.dotfiles"

function make_symlink () {
    echo "Installing $1 ..."
    rm -f ~/$1
    ln -s $DOT_FILES/$1 ~/$1
}

make_symlink .Xresources
make_symlink .bash_aliases
make_symlink .bash_profile
make_symlink .bashrc
make_symlink .mpdconf
make_symlink .wgetrc
make_symlink .xbindkeysrc
make_symlink .xinitrc
make_symlink .xmodmaprc
