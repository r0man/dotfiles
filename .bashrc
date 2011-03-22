
# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="~/bin:$PATH"

# Hadoop
export HADOOP_HOME="$HOME/local/hadoop"
export PATH="$HADOOP_HOME/bin:$HADOOP_HOME/src/contrib/ec2/bin:$PATH"
