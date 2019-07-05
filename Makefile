# -*- GNUmakefile -*-
# 
# Makefile for xpywm installation on Debian GNU/Linux system.
# Copyright (c) 2017-2019, Hiroyuki Ohsaki.
# All rights reserved.
# 
#  $Id: Makefile,v 1.5 2019/03/13 12:09:21 ohsaki Exp ohsaki $
# 

DESTDIR = /usr/local
BINDIR = $(DESTDIR)/bin
FONTDIR = $(DESTDIR)/share/fonts

PROGS = bin/xpywm bin/xpymon bin/xpylog
FONTS = share/8x8maru.bdf

PACKAGES = curl rsyslog python3 python3-xlib \
	xserver-xorg xbase-clients rxvt-unicode xfonts-terminus redshift 

XPYWM_URL = http://www.lsnl.jp/~ohsaki/software/xpywm
PYTHON_URL = http://www.lsnl.jp/~ohsaki/software/python
PYTHON_MODULES = perl.py tbdump.py term.py xutil.py
SKELTON_FILES = .xinitrc .Xdefaults .emacs

all:
	@echo "Run 'make install' as root."
	@echo "Run 'make config-xconsole' as root to enable xconsole and xpylog."
	@echo "Run 'make fetch-skelton' to download sample configuration files."

install:	confirm-debian install-packages install-modules install-xpywm install-xpymon install-xpylog

confirm-debian:
	@if [ ! -f /etc/debian_version ]; then \
	  echo "error: this script supports only Debian GNU/Linux systems."; \
	  exit 1; \
	fi

install-packages:
	apt install $(PACKAGES)

install-modules:
	for i in $(PYTHON_MODULES); \
	do \
	  dir=`echo /usr/local/lib/python3.*/dist-packages`; \
	  curl $(PYTHON_URL)/$$i >$$dir/$$i; \
	done

install-xpywm:
	curl $(XPYWM_URL)/xpywm >$(BINDIR)/xpywm
	chmod 755 $(BINDIR)/xpywm
	curl $(XPYWM_URL)/8x8maru.bdf >$(FONTDIR)/8x8maru.bdf
	chmod 644 $(FONTDIR)/8x8maru.bdf
	mkfontdir $(FONTDIR)
	@echo "Do not forget to add $(FONTDIR) to your fontpath."

install-xpymon:
	curl $(XPYWM_URL)/xpymon >$(BINDIR)/xpymon
	chmod 755 $(BINDIR)/xpymon

install-xpylog:
	curl $(XPYWM_URL)/xpylog >$(BINDIR)/xpylog
	chmod 755 $(BINDIR)/xpylog

config-xconsole:
	if ! grep /dev/xconsole /etc/rsyslog.conf >/dev/null; then \
	  cp /etc/rsyslog.conf /etc/rsyslog.conf.bak; \
	  echo 'daemon.*;mail.*;news.err;*.=debug;*.=info;*.=notice;*.=warn	|/dev/xconsole' >>/etc/rsyslog.conf; \
	  /etc/init.d/rsyslog restart; \
	fi
	if ! grep /dev/xconsole /etc/rc.local >/dev/null; then \
	  echo 'mkfifo /dev/xconsole; chmod 640 /dev/xconsole; chown root.adm /dev/xconsole' >>/etc/rc.local; \
	fi
	@echo "Make sure to add user(s) to adm group (e.g., sudo usermod -G adm account)."

fetch-skelton:
	for i in $(SKELTON_FILES); \
	do \
	  curl $(XPYWM_URL)/skel$$i >skel$$i; \
	done

DO-NOT-RUN-THIS-TARGET:
	sudo make install
	sudo make config-xconsole
	sudo usermod -G adm -a $$USER
	make fetch-skelton
	for i in $(SKELTON_FILES); \
	do \
	  [ -f $$HOME/$$i ] && mv $$HOME/$$i $$HOME/$$i.bak; \
	  cp -v skel$$i $$HOME/$$i; \
	done
