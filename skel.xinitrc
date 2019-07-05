#!/bin/sh

xset +fp /usr/local/share/fonts
setxkbmap -option ctrl:nocaps
xset r rate 200 40

redshift -l 35:135 &
xpywm 2>/tmp/xpywm.log &
xpymon 2>/tmp/xwpymon.log &
xpylog 2>/tmp/xpylog.log &
emacs &
urxvt
