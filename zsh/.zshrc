# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/roman/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt AUTO_CD

# Allow comments even in interactive shells (especially for Muness)
setopt INTERACTIVE_COMMENTS

# HISTORY

# Allow multiple terminal sessions to all append to one zsh command history
setopt APPEND_HISTORY

# Add comamnds as they are typed, don't wait until shell exit
setopt INC_APPEND_HISTORY

# Do not write events to history that are duplicates of previous events
setopt HIST_IGNORE_DUPS

# When searching history don't display results already cycled through twice
setopt HIST_FIND_NO_DUPS

# Remove extra blanks from each command line being added to history
setopt HIST_REDUCE_BLANKS

# Include more information about when the command was executed, etc
setopt EXTENDED_HISTORY

# COMPLETION

# Allow completion from within a word/phrase
setopt COMPLETE_IN_WORD

# When completing from the middle of a word, move the cursor to the end of the word
setopt ALWAYS_TO_END

# PROMPT

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
path+=("$HOME/.cask/bin")

# Kubernetes
export KUBERNETES_PROVIDER=vagrant
path+=("$HOME/workspace/kubernetes/cluster")
alias kubectl="kubectl.sh"

# NVM
[ -r /usr/share/nvm/init-nvm.sh ] && . /usr/share/nvm/init-nvm.sh

# OPENEV
path+=("/usr/local/openev/bin")

export PATH
