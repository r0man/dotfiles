# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_colored_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
   . ~/.bash_aliases
fi

# Enable color support of ls and also add handy aliases
# if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'

    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'

#     alias grep='grep --color=auto'
#     alias fgrep='fgrep --color=auto'
#     alias egrep='egrep --color=auto'

fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Degrib
export PATH="$PATH:/home/roman/local/degrib/bin"

# Grads
export PATH="$PATH:~/local/grads-2.0.a7.oga.3/Contents"

# Java
export JAVA_HOME="/usr/lib/jvm/java-6-sun"

# Use Emacs as editor.
export EDITOR="emacsclient -c"
export VISUAL="emacsclient -c"

# Hadoop
export HADOOP_HOME="$HOME/local/hadoop"
export PATH="$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/src/contrib/ec2/bin"

# EC2
export EC2_CERT="$HOME/.ec2/cert-EF7DZP2B5QTM2A54TDLVLVKYWSDR6H4L.pem"
export EC2_PRIVATE_KEY="$HOME/.ec2/pk-EF7DZP2B5QTM2A54TDLVLVKYWSDR6H4L.pem"

# Pig
export PIG_HOME="$HOME/local/pig"
export PATH="$PATH:$PIG_HOME/bin"

# Gradle 
export GRADLE_HOME="$HOME/local/gradle"
export PATH="$PATH:$GRADLE_HOME/bin"

# Google App Engine SDK
export GAE_SDK_HOME="$HOME/local/appengine-java-sdk-1.3.0"
export PATH="$PATH:$GAE_SDK_HOME/bin"

# # http://wiki.github.com/aslakhellesoy/cucumber/console-colours
# export CUCUMBER_COLORS="undefined=black,italic:pending=black,bold,italic:pending_param=black,bold"

# # Set the TERM to 'emacs' if running inside an emacs shell.
# if [ "$EMACS" == "t" ]; then
#     export TERM="emacs"
# fi

# RVM
if [[ -s /home/roman/.rvm/scripts/rvm ]] ; then source /home/roman/.rvm/scripts/rvm ; fi
export LC_TYPE="en_US.UTF8"
