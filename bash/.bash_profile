# .BASH_PROFILE VS .BASHRC
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Keychain
eval $(keychain --eval --agents "gpg,ssh" --quiet id_rsa)

# Add ssh keys.
for i in $(ls -1 ~/.ssh/*.pub ); do
    ssh-add ${i/.pub/}
done

export EDITOR="emacsclient"

# SOLARIZED
export SOLARIZED="dark"
if [ -e ~/.dotfiles/dircolors.ansi-$SOLARIZED ]; then
    eval `dircolors ~/.dotfiles/dircolors.ansi-$SOLARIZED`
fi

# CASK
export PATH="$HOME/.cask/bin:$PATH"

# NODE
export PATH="$HOME/.node_modules/bin:$PATH"

# NUBANK
[ -r /home/roman/.nurc ] && . /home/roman/.nurc

# V8
export V8_HOME="/usr/bin"

# PATH
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.dotfiles/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# opam configuration
test -r /home/roman/.opam/opam-init/init.sh && . /home/roman/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
