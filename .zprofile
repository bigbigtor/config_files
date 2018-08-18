export TERMINAL=termite
export SCRIPT_DIR=~/.i3/scripts
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx /usr/bin/i3
