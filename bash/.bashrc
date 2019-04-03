# .BASH_PROFILE VS .BASHRC
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Load bash aliases.
[ -r ~/.bash_aliases ] && . ~/.bash_aliases

export EDITOR="emacsclient"

# SOLARIZED
export SOLARIZED="dark"
if [ -e ~/.dotfiles/dircolors.ansi-$SOLARIZED ]; then
    eval `dircolors ~/.dotfiles/dircolors.ansi-$SOLARIZED`
fi

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# PATH
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.dotfiles/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# BASH
export HISTCONTROL="ignoredups"
export HISTSIZE=10000
export HISTFILESIZE=10000

shopt -s histappend
PROMPT_COMMAND="history -a"

# CASK
export PATH="$HOME/.cask/bin:$PATH"

# NODE
export PATH="$HOME/.node_modules/bin:$PATH"

# NUBANK
[ -r /home/roman/.nurc ] && . /home/roman/.nurc

# PERL
export PATH="/usr/bin/site_perl:$PATH"

# V8
export V8_HOME="/usr/bin"
