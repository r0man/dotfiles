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

HOSTNAME=`hostname`
if [ -e "$HOME/.bashrc.$HOSTNAME" ]; then
    source "$HOME/.bashrc.$HOSTNAME"
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

# HEROKU
export PATH="/usr/local/heroku/bin:$PATH"

# HADOOP
export HADOOP_HOME="/home/hdfs/hadoop"
export PATH="$HADOOP_HOME/bin:$PATH"
export PATH="$HADOOP_HOME/contrib/fuse-dfs:$PATH"

# HIVE
export HIVE_HOME="/home/hdfs/hive"
export PATH="$HIVE_HOME/bin:$PATH"

# MAHOUT
export MAHOUT_HOME="/home/hdfs/mahout"
export PATH="$MAHOUT_HOME/bin:$PATH"

# NUTCH
export NUTCH_HOME="$HOME/local/nutch"
export PATH="$NUTCH_HOME/bin:$PATH"

# PIG
export PIG_HOME="$HOME/local/pig"
export PATH="$PIG_HOME/bin:$PATH"

# RVM
[ -r /etc/profile.d/rvm.sh ] && . /etc/profile.d/rvm.sh

# JAVA
[ -r /etc/profile.d/jdk.sh ] && . /etc/profile.d/jdk.sh

# OOZIE
export OOZIE_HOME="/home/hdfs/oozie"
export PATH="$OOZIE_HOME/bin:$PATH"

# PERL
export PATH="/usr/bin/site_perl:$PATH"

# STORM
export STORM_HOME="$HOME/local/storm"
export PATH="$STORM_HOME/bin:$PATH"

# V8
export V8_HOME="/usr/bin"

# VERTICA
export VERTICA_HOME="/opt/vertica"
export PATH="$VERTICA_HOME/bin:$PATH"

# ZOOKEEPER
export ZOOKEEPER_HOME="$HOME/local/zookeeper"
export PATH="$ZOOKEEPER_HOME/bin:$PATH"
