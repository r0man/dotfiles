# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify correct_all
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/roman/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Prevent putting duplicate lines in the history.
setopt HIST_IGNORE_DUPS

# Prompt
autoload -U promptinit
promptinit
prompt redhat

source ~/.bash_aliases

# Solarized color theme

export SOLARIZED="dark"
if [ -e ~/.dotfiles/dircolors.ansi-$SOLARIZED ]; then
    eval `dircolors ~/.dotfiles/dircolors.ansi-$SOLARIZED`
fi

# Emacs shell dir tracking.
if [ -n "$INSIDE_EMACS" ]; then
  chpwd() { print -P "\033AnSiTc %d" }
  print -P "\033AnSiTu %n"
  print -P "\033AnSiTc %d"
fi

alias -s html=chromium
alias -s clj="emacsclient -n"
alias lein-ancient="lein ancient upgrade :interactive"

# RVM
[ -r /etc/profile.d/rvm.sh ] && . /etc/profile.d/rvm.sh

# JAVA
[ -r /etc/profile.d/jdk.sh ] && . /etc/profile.d/jdk.sh

path+=("$HOME/bin")
path+=("/usr/local/bin")
path+=("/usr/local/heroku/bin")
export PATH
