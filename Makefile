# http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

PROGRAMS = bash mpd paktahn wget x11 xmonad local zsh

all:
	stow ${PROGRAMS}

clean:
	stow -D ${PROGRAMS}
