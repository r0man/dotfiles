
# aptitude
alias ai="sudo aptitude install"
alias ar="sudo aptitude remove"
alias ap="sudo aptitude purge"
alias upgrade="sudo aptitude update && sudo aptitude safe-upgrade"

# ls
alias ll='ls -l'
alias la='ls -la'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
