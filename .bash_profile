#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Keychain
eval $(keychain --eval id_rsa)
