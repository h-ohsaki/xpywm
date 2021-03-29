#!/bin/sh

# xpywm installation script for Debian GNU/Linux.

sudo apt install -y xbase-clients rxvt-unicode xfonts-terminus net-tools redshift python3-pip
sudo pip3 install xpywm xpymon xpylog

cd $HOME
for i in .Xdefaults .emacs .xinitrc
do
    wget -O $i http://www.lsnl.jp/~ohsaki/software/xpywm/skel$i
done
