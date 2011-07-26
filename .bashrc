
# Check for an interactive session
[ -z "$PS1" ] && return

# Load bash aliases.
[ -r ~/.bash_aliases ] && . ~/.bash_aliases

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="~/bin:$PATH"

# JAVA
[ -r /etc/profile.d/jdk.sh ] && . /etc/profile.d/jdk.sh

# Hadoop
export HADOOP_HOME="$HOME/local/hadoop"
export PATH="$HADOOP_HOME/bin:$HADOOP_HOME/src/contrib/cloud/src/py:$PATH"

# Setup AWS credentials.
[ -r ~/.aws.sh ] && . ~/.aws.sh
