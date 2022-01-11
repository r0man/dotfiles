# http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

PROGRAMS = bash bin config conky guix picom color-profiles dunst gnupg isync mplayer mpd paktahn polybar rofi sbcl wget x11 xmonad local tmux web-beautify zsh xscreensaver stumpwm xmodmap yaourt zprint

all:
	stow ${PROGRAMS}

clean:
	stow -D ${PROGRAMS}
