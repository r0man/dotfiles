# http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

PROGRAMS = bash bin chromium conky compton color-profiles gnupg mplayer mpd paktahn polybar rofi sbcl wget x11 xmonad local tmux web-beautify zsh xscreensaver stumpwm xmodmap yaourt

all:
	stow ${PROGRAMS}

clean:
	stow -D ${PROGRAMS}
