#!/bin/sh

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

xmodmap ~/.xmodmap
ibus-daemon -dx
exec dbus-launch awesome
