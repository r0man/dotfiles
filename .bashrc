
# Check for an interactive session
[ -z "$PS1" ] && return

# Load bash aliases.
[ -r ~/.bash_aliases ] && . ~/.bash_aliases

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
export HADOOP_HOME="/home/hadoop/hadoop-0.20.2-cdh3u1"
export HADOOP_HOME="/home/roman/local/hadoop"
export PATH="$HADOOP_HOME/bin:$HADOOP_HOME/src/contrib/cloud/src/py:$PATH"

# MAHOUT
export MAHOUT_HOME="/home/roman/local/mahout"
export PATH="$MAHOUT_HOME/bin:$PATH"

# NUTCH
export NUTCH_HOME="/home/roman/local/nutch"
export PATH="$NUTCH_HOME/bin:$PATH"

# JAVA
[ -r /etc/profile.d/jdk.sh ] && . /etc/profile.d/jdk.sh

# Storm
if [ -d ~/local/storm ]; then
    PATH="$PATH:~/local/storm/bin"
fi
