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
#exec optirun /usr/bin/steam -bigpicture

PATH=$PATH:/home/alex/bin
PATH=$PATH:/root/.gem/ruby/2.3.0/bin
export PATH

#barmk.sh | drawBar.sh &
#z3braBar.sh | drawTopBar.sh &

setxkbmap -option grp:alt_shift_toggle us,cz
mpd

monitorToggleHDMI1.sh
monitorToggleHDMI-1.sh

. ~/.bash_aliases
#xpad &

synclient TouchpadOff=1
#compton --config ~/.config/compton/compton.conf -b
#compton --config ~/.config/compton/compton_shadow.conf -b
#unclutter &
#bar.sh &
#nmcli dev wifi connect <name> password <password>

#hsetroot -tile ~/usr/pictures/wallpapers/repeat/grid_tile.png
#set_theme brown_space
xrdb -override ~/usr/dotfiles/colors/cloud.colors
#~/bin/conky

cat ~/usr/startup_notifications | xargs -L1 popup &

#conky &
#xsnow -notrees -nosanta -norudolf &

#prevent screen sleep mode
xset s off -dpms

redshift &
~/bin/switchCapsLockWithEsc

#wew | xEventReactor.sh &
sxhkd ~/.config/sxhkd/wmutils &
#exec openbox-session
#exec pekwm
#exec /home/alex/src/aewmpp/aewm++
exec dwm
exec urxvt -b 25

#sxhkd ~/.config/sxhkd/bspwm &
#exec bspwm
