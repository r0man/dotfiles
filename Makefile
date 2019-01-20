# http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

PROGRAMS = bash bin conky compton color-profiles emacs gnupg mplayer mpd paktahn polybar sbcl wget x11 xmonad local tmux web-beautify zsh xscreensaver stumpwm xmodmap yaourt

all:
	stow ${PROGRAMS}

clean:
	stow -D ${PROGRAMS}
