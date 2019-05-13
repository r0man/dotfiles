# .BASH_PROFILE VS .BASHRC
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Load bash aliases.
[ -r ~/.bash_aliases ] && . ~/.bash_aliases

# Autojump
[ -r /etc/profile.d/autojump.bash ] && . /etc/profile.d/autojump.bash

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# BASH
export HISTCONTROL="ignoredups"
export HISTSIZE=10000
export HISTFILESIZE=10000

shopt -s histappend
PROMPT_COMMAND="history -a"

export PATH="$HOME/.local/bin:$PATH"

# FZF
[ -r /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -r /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash

# KAFKA
KAFKA_HOME="$HOME/local/kafka"
if [ -d $KAFKA_HOME ]; then
    export KAFKA_HOME
    export PATH="$KAFKA_HOME/bin:$PATH"
fi
