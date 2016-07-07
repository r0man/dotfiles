# http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

PROGRAMS = bash bin conky gnupg mplayer mpd paktahn sbcl wget x11 xmonad local tmux web-beautify zsh xscreensaver stumpwm yaourt

all:
	stow ${PROGRAMS}

clean:
	stow -D ${PROGRAMS}
