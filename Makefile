# http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

PROGRAMS = bash mpd paktahn rubygems wget x11 xmonad

all:
	stow ${PROGRAMS}

clean:
	stow -D ${PROGRAMS}
