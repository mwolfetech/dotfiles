#running inside virtualbox
/usr/bin/VBoxClient-all &

#xrdb $HOME/.Xresources

#no ugly cross cursor
xsetroot -cursor_name left_ptr
xsetroot -solid '#80a0af'

# if we have private ssh key(s), start ssh-agent and add the key(s)
id1=$HOME/.ssh/identity
id2=$HOME/.ssh/id_dsa
id3=$HOME/.ssh/id_rsa
if [ -x /usr/bin/ssh-agent ] && [ -f $id1 -o -f $id2 -o -f $id3 ];
then
  eval `ssh-agent -s`
  ssh-add < /dev/null
fi

#map extra thinkpad keys above left/right arrows
xmodmap -e "keycode 233 = Page_Down"
xmodmap -e "keycode 234 = Page_Up"

#no caps lock, second ctrl key instead
xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "keysym Caps_Lock = Control_L"
xmodmap -e "add Control = Control_L"

#thunar --daemon &
#rox -b Default -p default
~/bin/tray &

#rocking xmonad these days
DEFAULT_SESSION=xmonad
case $1 in
  fluxbox) exec startfluxbox ;;
  awesome) exec awesome ;;
  xmonad)
     exec xmonad ;;
  *) exec $DEFAULT_SESSION ;;
esac


