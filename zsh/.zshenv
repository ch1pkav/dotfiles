export PATH=$PATH:/home/vepbxer/.local/bin:/home/vepbxer/.cargo/bin:/home/vepbxer/.local/share/arm-gnu-toolchain-13.2/bin
export XDG_PICTURES_DIR=/home/vepbxer/Pictures/Screenshots
if [ -z "${DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec dbus-launch --exit-with-session sway > .swaylog
fi
alias sdc='sudo dispatch-conf'
alias eql='equery list -po'
alias kssh='kitty +kitten ssh'
alias n='nohup'
