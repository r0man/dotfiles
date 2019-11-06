# Solarized color theme

export SOLARIZED="dark"
if [ -e ~/.dotfiles/dircolors.ansi-$SOLARIZED ]; then
    eval `dircolors ~/.dotfiles/dircolors.ansi-$SOLARIZED`
fi

# Emacs shell dir tracking.
if [ -n "$INSIDE_EMACS" ]; then
  chpwd() { print -P "\033AnSiTc %d" }
  print -P "\033AnSiTu %n"
  print -P "\033AnSiTc %d"
fi

alias lein-ancient="lein ancient upgrade :interactive :check-clojure :all"

# RVM
[ -r /etc/profile.d/rvm.sh ] && . /etc/profile.d/rvm.sh

# JAVA
[ -r /etc/profile.d/jdk.sh ] && . /etc/profile.d/jdk.sh

path+=("$HOME/bin")
path+=("/usr/local/bin")
path+=("/usr/local/heroku/bin")
path+=("$HOME/.cask/bin")
path+=("$HOME/.local/bin")

# NPM
path+=("$HOME/.node_modules/bin:$PATH")
export npm_config_prefix=~/.node_modules

# NVM
[ -r /usr/share/nvm/init-nvm.sh ] && . /usr/share/nvm/init-nvm.sh

# OPENEV
path+=("/usr/local/openev/bin")

# SPARK
path+=("/opt/apache-spark/bin")

# STUMPWM
path+=("$HOME/workspace/stumpwm-contrib/util/stumpish")

# Google Application Default Credentials
# See: https://developers.google.com/identity/protocols/application-default-credentials
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/application_default_credentials.json"

# VIRTUALENVWRAPPER
export WORKON_HOME=~/.virtualenv
[ -r /usr/bin/virtualenvwrapper.sh ] && . /usr/bin/virtualenvwrapper.sh

[ -r /home/roman/.nurc ] && source /home/roman/.nurc

# # Keychain

# eval $(keychain --eval --agents "gpg,ssh" --quiet id_rsa)

# # Add ssh keys.
# for i in $(ls -1 ~/.ssh/*.pub ); do
#     ssh-add ${i/.pub/}
# done

export PATH

source ~/.bash_aliases
