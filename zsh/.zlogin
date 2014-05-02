# Start the GnuPG agent and enable OpenSSH agent emulation
gnupginf="${HOME}/.gpg-agent-info"

if pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
    eval `cat $gnupginf`
    eval `cut -d= -f1 $gnupginf | xargs echo export`
else
    eval `gpg-agent -s --enable-ssh-support --daemon --write-env-file "$gnupginf"`
fi
