# http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

PROGRAMS = bash conky gnupg mplayer mpd paktahn wget x11 xmonad local tmux web-beautify zsh xscreensaver

all:
	stow ${PROGRAMS}

clean:
	stow -D ${PROGRAMS}
