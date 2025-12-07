#Setup everything the moment I log on to my first tty.
export XINITRC="$HOME/.config/X11/xinitrc"
export QT_STYLE_OVERRIDE=kvantum
[ "$(tty)" = "/dev/tty1" ] && exec xinit
