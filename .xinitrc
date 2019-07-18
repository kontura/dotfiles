#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

PATH=$PATH:/home/amatej/Usr/bin
export PATH

DESKTOP_SESSION=wmutils
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
  sxhkd ~/.config/sxhkd/wmutils &
  wew | xEventReactor.sh &
  exec st
fi
if [ "$DESKTOP_SESSION" == "bspwm" ]; then
  export XDG_CONFIG_HOME="/home/amatej/.config"
  feh --bg-center /home/amatej/Pictures/wallhaven-171381.jpg
  sxhkd ~/.config/sxhkd/bspwm &
fi
if [ "$DESKTOP_SESSION" == "sway" ]; then
  feh --bg-center /home/amatej/Pictures/wallhaven-171381.jpg
  exec sway
fi

unclutter &
hexchat &
#sxhkd ~/.config/sxhkd/dwm &
#sxhkd ~/.config/sxhkd/dwm &
#exec openbox-session
#exec pekwm
#exec /home/alex/src/aewmpp/aewm++
#exec dwm

#sxhkd ~/.config/sxhkd/bspwm &
#exec bspwm
