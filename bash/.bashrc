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

# Virtual Env
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper_lazy.sh

# Nubank
[ -r /home/roman/.nurc ] && source /home/roman/.nurc

# Flutter
export PATH="$PATH:$HOME/local/flutter/bin"

# FZF
[ -r /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -r /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash

# KAFKA
KAFKA_HOME="$HOME/local/kafka"
if [ -d $KAFKA_HOME ]; then
    export KAFKA_HOME
    export PATH="$KAFKA_HOME/bin:$PATH"
fi

# Google Application Default Credentials
# See: https://developers.google.com/identity/protocols/application-default-credentials
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/application_default_credentials.json"

PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;
