# https://www.gnupg.org/faq/whats-new-in-2.1.html#autostart
SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
export SSH_AUTH_SOCK
gpgconf --launch gpg-agent
