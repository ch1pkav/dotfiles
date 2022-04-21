export PATH=$PATH:/home/vepbxer/.local/bin:/home/vepbxer/.cargo/bin
export XDG_PICTURES_DIR=/home/vepbxer/Pictures/Screenshots
if [ -z "${DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec dbus-launch --exit-with-session sway > .swaylog
fi
