# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:/home/amatej/Usr/bin
export PATH

#barmk.sh | drawBar.sh &
#z3braBar.sh | drawTopBar.sh &

setxkbmap -option grp:rctrl_rshift_toggle us,cz


monitorDuplicate.sh

. ~/.bash_aliases

~/Usr/bin/switchCapsLockWithEsc


if [ "$DESKTOP_SESSION" == "dwm" ]; then
  feh --bg-center /home/amatej/Pictures/fedora.jpg
  sxhkd ~/.config/sxhkd/dwm &
fi
if [ "$DESKTOP_SESSION" == "wmutils" ]; then
  feh --bg-center /home/amatej/Pictures/fedora.jpg
  focus_watcher.sh &
  sxhkd ~/.config/sxhkd/wmutils &
  wew | xEventReactor.sh &
fi
if [ "$DESKTOP_SESSION" == "bspwm" ]; then
  export XDG_CONFIG_HOME="/home/amatej/.config"
  feh --bg-center /home/amatej/Pictures/wallhaven-171381.jpg
  sxhkd ~/.config/sxhkd/bspwm &
fi

unclutter &
hexchat &
