#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Load bash aliases.
[ -r ~/.bash_aliases ] && . ~/.bash_aliases

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# PATH
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# AWS
[ -r ~/.aws.sh ] && . ~/.aws.sh

# BASH
HISTSIZE=10000

# CLOJURE SCRIPT
export CLOJURESCRIPT_HOME="$HOME/workspace/clojurescript"
export PATH="$CLOJURESCRIPT_HOME/bin:$PATH"

# FLUME
export FLUME_HOME="/home/hdfs/flume"
export PATH="$FLUME_HOME/bin:$PATH"

# HADOOP
export HADOOP_HOME="/home/hdfs/hadoop"
export PATH="$HADOOP_HOME/bin:$PATH"
export PATH="$HADOOP_HOME/contrib/fuse-dfs:$PATH"

# HIVE
export HIVE_HOME="/home/hdfs/hive"
export PATH="$HIVE_HOME/bin:$PATH"

# MAHOUT
export MAHOUT_HOME="$HOME/local/mahout"
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

# PERL
export PATH="/usr/bin/site_perl:$PATH"

# STORM
export STORM_HOME="$HOME/local/storm"
export PATH="$STORM_HOME/bin:$PATH"

# ZOOKEEPER
export ZOOKEEPER_HOME="$HOME/local/zookeeper"
export PATH="$ZOOKEEPER_HOME/bin:$PATH"

# CLOJURESCRIPT TESTS
export V8_HOME="/usr/bin"
