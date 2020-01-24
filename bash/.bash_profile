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

# CONFLUENT PLATFORM

export CONFLUENT_HOME="$HOME/local/confluent"
export PATH="$CONFLUENT_HOME/bin:$PATH"

# HETZNER KUBE

source <(hetzner-kube completion bash)

# NODE

export PATH="$HOME/.node_modules/bin:$PATH"

# NUBANK

[ -r /home/roman/.nurc ] && . /home/roman/.nurc

# POSTGRESQL OPERATOR

export PGO_CA_CERT="$HOME/.pgo/pgo/client.crt"
export PGO_CLIENT_CERT="$HOME/.pgo/pgo/client.crt"
export PGO_CLIENT_KEY="$HOME/.pgo/pgo/client.pem"
export PGO_APISERVER_URL='https://127.0.0.1:8443'

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
