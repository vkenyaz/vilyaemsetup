#Setup everything the moment I log on to my first tty.
export XINITRC="$HOME/.config/X11/xinitrc"
export QT_STYLE_OVERRIDE=kvantum
export QT_QPA_PLATFORMTHEME="qt5ct:qt6ct"
export QT6_QPA_PLATFORMTHEME=qt6ct
export QT6_STYLE_OVERRIDE=kvantum
export XCURSOR_THEME="Bibata-Modern-Classic"
export PATH="$HOME/.nix-profile/bin:$PATH"
export GTK_USE_PORTAL=1
export XDG_CURRENT_DESKTOP=KDE
export RLWRAP_EDITOR="vim '+call cursor(%L,%C)'"
[ "$(tty)" = "/dev/tty1" ] && startx
#[ "$(tty)" = "/dev/tty1" ] && exec doas slim
