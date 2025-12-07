#############################################
# Description - My ZSH configuration
# Author - Vilyaem
############################################

##########Zsh##########
source  /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#autoload -Uz compinit -C -d "$ZSH_COMPDUMP/.zcompdump-${ZSH_VERSION}"
autoload -U colors && colors
_comp_options+=(globdots)
# Enable case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# Show possible completions in a menu
zstyle ':completion:*' menu select
# Enable auto-correction of mistyped commands
setopt correct
# Enable typing just a directory to traverse
setopt autocd
# Set the theme
#ZSH_THEME="agnoster"
# History settings
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh_history
export ZSH_COMPDUMP="$HOME/.cache/zcompdump"
setopt append_history
setopt share_history
#export PS1="%{$fg[blue]%}$USER%%%{$reset_color%} %~ "
export PS1="%{$fg[blue]%%$reset_color%} %~ "
#export PS1="$USER%% %~ "
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/r/zig-linux-x86_64-0.13.0/:$PATH"
export PATH="$HOME/.local/share/cargo/bin/:$PATH"
export PATH=$PATH:/usr/local/go/bin
#Add/enable Vi mode
bindkey -v
#Arrow key history completion
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward


##########Default Programs##########
export BROWSER="librewolf"
export BUG_PROJECT=$(pwd)/bug
export CC="gcc"
export EDITOR="v"
#export MANPAGER='nvim +Man!'
export MANPAGER='sh -c "col -b | nvim -R -"'
export TERMINAL="st"
export SESSION_MANAGER="slim"

##########Ricing##########
export XCURSOR_THEME="Bibata-Modern-Classic"
export QT_QPA_PLATFORMTHEME="qt5ct:qt6ct"
export QT_STYLE_OVERRIDE=kvantum
eval $(dircolors -b)

##########Cleanup##########
export INPUTRC="~/.config/readline/.inputrc"
export XINITRC="$HOME/.config/X11/xinitrc"
#export PYTHONSTARTUP="$HOME/.config/pythonrc"
export LESSHISTFILE="-"
#export CARGO_HOME="$XDG_DATA_HOME"/cargo
export ASPELL_CONF="per-conf $XDG_CONFIG_HOME/aspell/aspell.conf; personal $XDG_DATA_HOME/aspell/en.pws; repl $XDG_DATA_HOME/aspell/en.prepl"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"

##########Wine##########
alias wine='WINEPREFIX="$HOME/.wine" WINEARCH=win32 wine'
alias wine64='WINEPREFIX="$HOME/.local/share/wineprefixes/default/" WINEARCH=win64 wine64'
#export WINEPREFIX=~/.wine64/
export WINEPREFIX=~/.local/share/wineprefixes/default/
export WINEARCH=win64


##########Aliases##########
alias abook='abook --datafile ~/.local/share/abook/addressbook'
alias alsafix='for x in `amixer controls  | grep layback` ; do amixer cset "${x}" on ; done' 
alias apc='doas apt list --installed | wc -l'
alias aplist='doas apt list --installed'
alias aptar='doas apt -y autoremove'
alias apti='doas apt install' 
alias aptu='doas apt install' 
alias aptui='doas apt install' 
alias aptiy='doas apt install -y' 
alias aptr='doas apt -y remove' 
alias apts='doas apt -y search' 
alias c='./c.sh' 
alias dosbox="dosbox -conf $HOME/.config/dosbox/dosbox.conf" 
alias dwifi='doas rfkill block wifi' 
alias emsetup='cd ~/r/emsdk/ && ./emsdk activate latest && source ./emsdk_env.sh && pwd' 
alias gc='git clone --recurse-submodules --depth=1' 
alias getcam='cp -u /mnt/DCIM/139CANON/* $HOME/m/vilyaem/'
alias getmouse='xdotool getmouselocation --shell' 
alias ghex='grabc -hex' 
alias gmt='xdg-mime query filetype $1' 
alias grgb='grabc -rgb' \
alias hosted='doas v /etc/hosts ; exit' 
alias l='\ls --color=auto --group-directories-first' 
alias ls='ls --color=auto -lah' 
alias makeiso='xorriso -as mkisofs -o $1.iso .' 
alias pg='ps aux | grep' 
alias phptmp='doas php -S localhost:80' 
alias printer='system-config-printer' 
alias qrcode='qrencode -s 20 "#1" -o qr.png' 
alias record='ffmpeg -y -f x11grab -r 25 -i :0.0 -vcodec libx264 -preset ultrafast -qp 0 -pix_fmt yuv444p -s 1280x720 vilcord-$(date -I).mkv' 
alias recordcast='ffmpeg -y -f x11grab -r 30 -i :0.0 -f alsa -i hw:0 -vcodec libx264 -preset ultrafast -qp 0 -pix_fmt yuv444p vilcast-$(date -I).mkv' 
alias recordmic='ffmpeg -y -f alsa -i hw:0 vilmic-$(date -I).ogg' 
alias setbug='export BUG_PROJECT=$(pwd)/bug' 
alias sk='screenkey' 
alias sx='sxiv' 
alias tarit='tar -czvf $1.tar.gz $1' 
alias tsm='transmission-remote' 
alias tsmd='pkill trans && transmission-daemon' 
alias untar='tar -xzvf $1' 
alias usbmnt='doas mount -t vfat /dev/sdb1 /mnt/ && ls /mnt/' 
alias usbumnt='doas umount /mnt/' 
alias vedit='cd ~ && v .vimrc' 
alias vgamon='xrandr --output VGA1 --mode 640x480 --pos -640x0 --output HDMI1 --pos 0x0' 
alias vi='nvim' 
alias vim='nvim' 
alias webcam='mpv /dev/video0' 
alias xb='xbacklight -set $1' 
alias yt='ytfzf --ii=inv.nadeko.net --show-thumbnails -T chafa --max-threads=$(nproc)' 
alias zipup='zip -r $1.zip $1 &&  rm $1'

##########Shell functions & utilities##########

#Dictionary!
dict(){
  grep $@ ~/.config/dict.csv | awk -F, '{print "Definition of "$1"..."; print "    " ;for (i=3; i<=NF; i++) printf "%s", $i; print ""}' | sed 's/\"//g'
}

#Internet dict.org dictionary
wdict(){
  for var in "$@"
  do
    curl dict://dict.org/d:"$var"
  done
}

#Read me a story!
story(){
  pdftotext $@ - | espeak --stdout | mpv -
}

#Logout
bye(){
  pkill tmux && doas su root --c 'pm-suspend'
}

#Make a journal entry
j(){
  vim $HOME/j/journal/$(date -I).md  $HOME/j/todos.md
}

#Download 'Tube links with yt-dlp
t(){
  yt-dlp -f "best[height<=360]" $(echo "$@"  | sed -e 's|inv\.nadeko\.net|youtube.com|g' -e 's|yewtu\.be|youtube.com|g')
}

#Watch 'tube links with mpv
tw(){
  mpv $(echo "$@" | sed -e 's|inv\.nadeko\.net|youtube.com|g' -e 's|yewtu\.be|youtube.com|g')
}

#Download 'tube with metadata
tm(){
noglob yt-dlp -x --audio-format mp3 --embed-metadata --embed-thumbnail --add-metadata $(echo "$@" | sed -e 's|inv\.nadeko\.net|youtube.com|g' -e 's|yewtu\.be|youtube.com|g')
}

#Yazi shell wrapper script
function y(){
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

#Flashdrive one-off backup
function bkupflash(){
  LOG="$HOME/.cache/bkupflash"
  SOURCE="/home/vilyaem/"
  MOUNTPOINT="/mnt"

  sudo borg create -v --stats --compression lz4 "$MOUNTPOINT/::backup-$(date -I)" "$SOURCE" # >> "$LOG" 2>&1
  sudo borg prune -v --list "$MOUNTPOINT/" --keep-last 1 # >> "$LOG" 2>&1
  sudo borg compact -v "$MOUNTPOINT/" # >> "$LOG" 2>&1
}

##########Zoxide##########
eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
