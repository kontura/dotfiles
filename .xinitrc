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

#barmk.sh | drawBar.sh &
#z3braBar.sh | drawTopBar.sh &

setxkbmap -option grp:rctrl_rshift_toggle us,cz

monitorDuplicate.sh

. ~/.bash_aliases

~/Usr/bin/switchCapsLockWithEsc
feh --bg-center /home/amatej/Pictures/wallhaven-37667.jpg

#wew | xEventReactor.sh &
sxhkd ~/.config/sxhkd/dwm &
#exec openbox-session
#exec pekwm
#exec /home/alex/src/aewmpp/aewm++
exec dwm
#exec st

#sxhkd ~/.config/sxhkd/bspwm &
#exec bspwm
