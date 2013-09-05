# .BASH_PROFILE VS .BASHRC
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Keychain
eval $(keychain --eval id_rsa)

# Add ssh keys.
for i in $(ls -1 ~/.ssh/*.pub ); do
    ssh-add ${i/.pub/}
done
