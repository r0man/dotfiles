
# Check for an interactive session
[ -z "$PS1" ] && return

# Load bash aliases.
[ -r ~/.bash_aliases ] && . ~/.bash_aliases

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="$HOME/bin:$PATH"

# AWS
[ -r ~/.aws.sh ] && . ~/.aws.sh

# BASH
HISTSIZE=10000

# CLOJURE SCRIPT
export CLOJURESCRIPT_HOME="$HOME/workspace/clojurescript"
export PATH="$CLOJURESCRIPT_HOME/bin:$PATH"

# HADOOP
export HADOOP_HOME="/home/hadoop/local/hadoop"
export PATH="$HADOOP_HOME/bin:$HADOOP_HOME/src/contrib/cloud/src/py:$PATH"

# MAHOUT
export MAHOUT_HOME="/home/roman/local/mahout"
export PATH="$MAHOUT_HOME/bin:$PATH"

# NUTCH
export NUTCH_HOME="/home/roman/local/nutch"
export PATH="$NUTCH_HOME/runtime/local/bin:$PATH"
#export PATH="$NUTCH_HOME/runtime/deploy/bin:$PATH"

# PIG
export PIG_HOME="/home/roman/local/pig"
export PATH="$PIG_HOME/bin:$PATH"

# JAVA
[ -r /etc/profile.d/jdk.sh ] && . /etc/profile.d/jdk.sh

# STORM
if [ -d ~/local/storm ]; then
    PATH="$PATH:~/local/storm/bin"
fi
