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
wew | xEventReactor.sh &

#barmk.sh | drawBar.sh &
#z3braBar.sh | drawTopBar.sh &

setxkbmap -option grp:alt_shift_toggle us,cz
mpd
sxhkd &

monitorToggleHDMI1.sh
monitorToggleHDMI-1.sh

xrdb -merge ~/usr/colors/dark_castle.colors
hsetroot -fill ~/usr/pictures/wallpapers/darkCasttle.png
#xpad &

synclient TouchpadOff=1
#compton --config ~/compton.conf -b &
unclutter &
#bar.sh &
#background_randomizer.sh
#nmcli dev wifi connect <name> password <password>

xmodmap -e "clear lock"
xmodmap -e "keycode 9 = Caps_Lock"
xmodmap -e "keycode 66 = Escape"
xmodmap -e "add Lock = Caps_Lock"

exec urxvt -b 15
