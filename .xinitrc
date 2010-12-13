/usr/bin/VBoxClient-all &

#xrdb $HOME/.Xresources
xsetroot -cursor_name left_ptr
xsetroot -solid '#000000'

# if we have private ssh key(s), start ssh-agent and add the key(s)
id1=$HOME/.ssh/identity
id2=$HOME/.ssh/id_dsa
id3=$HOME/.ssh/id_rsa
if [ -x /usr/bin/ssh-agent ] && [ -f $id1 -o -f $id2 -o -f $id3 ];
then
  eval `ssh-agent -s`
  ssh-add < /dev/null
fi

amixer set Master 90% unmute &
amixer set PCM 85% unmute &
#xset fp+ /usr/local/lib/X11/fonts/terminus
#xset fp+ /usr/local/lib/X11/fonts/ghostscript
#xset fp+ /usr/X11R6/lib/X11/fonts/TTF/

# xset fp rehash
#xset b 100 0 0
#xset r rate 300 170

xmodmap -e "keycode 233 = Page_Down"
xmodmap -e "keycode 234 = Page_Up"
xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "keysym Caps_Lock = Control_L"
xmodmap -e "add Control = Control_L"

source $HOME/.fehbg  &
#thunar --daemon &
#rox -b Default -p default
urxvtd &
~/bin/tray &
start-pulseaudio-x11 &

pidgin &
parcellite &

DEFAULT_SESSION=xmonad
case $1 in
  fluxbox) exec startfluxbox ;;
  awesome) exec awesome ;;
  xmonad)
     exec xmonad ;;
  *) exec $DEFAULT_SESSION ;;
esac
