#Login to window manager the moment I login to my first tty.
if [[ $(tty) == /dev/tty1 ]]; then
    doas slim
fi
