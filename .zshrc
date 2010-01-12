# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

# Spell check commands!  (Sometimes annoying)
setopt CORRECT

# Use the suse prompt.
autoload -U promptinit
promptinit
prompt suse

# Aliases for 'ls'.
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Aliases for 'aptitude'.
alias ai='sudo aptitude install'
alias ar='sudo aptitude remove'
alias ap='sudo aptitude purge'

# Alias for a safe system upgrade.
[ -r /etc/debian_version ] && [ -x `which sudo` ] && alias upgrade='sudo aptitude update && sudo aptitude safe-upgrade'

# Export Hadoop & Pig environment.
export HADOOP_HOME="$HOME/local/hadoop"
export PATH="$PATH:$HADOOP_HOME/bin"
export PATH="$PATH:$HOME/local/pig/bin"


