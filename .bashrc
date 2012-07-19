
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
export HADOOP_HOME="/home/hdfs/local/hadoop"
export PATH="$HADOOP_HOME/bin:$PATH"
export PATH="$HADOOP_HOME/contrib/fuse-dfs:$PATH"

# KEYCHAIN
keychain --quick --quiet --agents ssh,gpg id_rsa
[[ -f $HOME/.keychain/$HOSTNAME-sh ]] && source $HOME/.keychain/$HOSTNAME-sh
[[ -f $HOME/.keychain/$HOSTNAME-sh-gpg ]] && source $HOME/.keychain/$HOSTNAME-sh-gpg

# MAHOUT
export MAHOUT_HOME="$HOME/local/mahout"
export PATH="$MAHOUT_HOME/bin:$PATH"

# NUTCH
export NUTCH_HOME="$HOME/local/nutch"
export PATH="$NUTCH_HOME/bin:$PATH"

# PIG
export PIG_HOME="$HOME/local/pig"
export PATH="$PIG_HOME/bin:$PATH"

# JAVA
[ -r /etc/profile.d/jdk.sh ] && . /etc/profile.d/jdk.sh

# STORM
export STORM_HOME="$HOME/local/storm"
export PATH="$STORM_HOME/bin:$PATH"

# ZOOKEEPER
export ZOOKEEPER_HOME="$HOME/local/zookeeper"
export PATH="$ZOOKEEPER_HOME/bin:$PATH"

# CLOJURESCRIPT TESTS
export V8_HOME="/usr/bin"
export SPIDERMONKEY_HOME="/usr/bin"
