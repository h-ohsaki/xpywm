# NAME

xpywm - A simple but extensible X11 window manager written in Python.

# SYNOPSIS

xpywm

# DESCRIPTION

This manual page documents **xpywm**, a simple but extensible X11 window manager
written in Python.  **xpywm** is a Python version of **pwm**
(http://www.lsnl.jp/~ohsaki/software/pwm/), an X11 window manager written in
Perl.

Development of **pwm** was motivated by perlwm (http://perlwm.sourceforge.net/),
which is a window manager written entirely in Perl.  The idea of implementing
X11 window manager in a light-weight language is great since it allows you to
fully customize the behavior of the window manager with a little programming.
Similarly to perlwm, **pwm** is built based on X11::Protocol module developed by
Stephen McCamant.

**xpywm** is ported from **pwm**.  **xpywm** uses python3-xlib module for
communication with the X11 display server.

The notable features of **xpywm** are its simplicity, compactness, and
programmable cascaded/tiled window placement algorithms.

**xpywm** is simple in a sense that it is entirely written in Python, and it
requires only python3-xlib module from PyPI.  **xpywm** is written with less
than 1,000 lines of code.  If you are familiar with X11 protocol and basics of
Python programming, you can easily read and understand the source code of
**xpywm**.

**xpywm** is compact since it provides minimal window decorations.  **xpywm** has
no pop-up menus, graphical icons, and window animations.  **xpywm** is designed
to consume the minimum amount of screen space for letting users and
applications to use as wide screen space as possible.  For instance, **xpywm**
draws the window title _inside_ the window, rather than outside the window,
which saves dozen-pixel lines around the window.

**xpywm** supports two types of window placement algorithms: programmed mode and
tiled mode.

In the programmed mode, you can specify rules for inferring appropriate window
geometries.  By default, Emacs is placed at the top-left corner of the screen
with 50% window width and 100% window height.  Firefox, chromium, mupdf, xdvi,
LibreOffice, tgif and Mathematica are placed next to the Emacs with 50% window
width and 100% window height.  The terminal window is placed at the
bottom-right corner with 50% window width and 70% window height.  If there
exist more than two terminal windows, the size of each terminal window is
shrunk to 1/4 of the screen, and placed in a non-overlapping way.

In the titled mode, all windows are placed in a titled fashion so that any
window will have the same window width and height, and that any window will
not overlap with others, as like tile-based window managers.  Moreover,
**xpywm** tries to allocate larger area for Emacs; i.e., if there are three
windows, say, Emacs and two terminals, Emacs will occupy the half of the
screen, and each terminal will have the quarter of the screen.

# OPTIONS

None

# INSTALLATION

```sh
$ pip3 install xpywm
```

# CUSTOMIZATION

Since Python is one of interpreters, you can easily customize the behavior of
**xpywm** by directly modifying its code.  For instance, if you want to change
the appearance of window frames, edit the constants section.  If you want to
change the keyboard binding, edit the hash variable KEYBOARD_HANDLER.  The key
of the dictionary is the name of an X11 keysym string.  The value of the
dictionary is self explanatory: modifier is the mask of keyboard modifiers and
callback is the reference to the callback function.

# BINDINGS

- Mod1 + Button1

  Move the current active window while dragging with pressing Mod1 + Button1.

- Mod1 + Button3

  Resize the current active window while dragging with pressing Mod1 + Button3.

- Ctrl + Mod1 + i

  Focus the next window.  Available windows are circulated in the order of
  top-left, bottom-left, top-right, and bottom-right.

- Ctrl + Mod1 + m

  Raise or lower the current active window.

- Ctrl + Mod1 + '

  Toggle the maximization of the current active window.

- Ctrl + Mod1 + ;

  Toggle the vertical maximization of the current active window.

- Ctrl + Mod1 + ,

  Layout all available windows in the programmed mode.

- Ctrl + Mod1 + .

  Layout all available windows in the tiled mode.

- Ctrl + Mod1 + z

  Destroy the current active window.

- Ctrl + Mod1 + x

  Toggle the current active window between the first and the second virtual screens.

- Ctrl + Mod1 + [

  Switch to the previous virtual screen.

- Ctrl + Mod1 + ]

  Switch to the next virtual screen.

- Ctrl + Mod1 + 1

  Run a command "(unset STY; urxvt) &" via os.system() function.

- Ctrl + Mod1 + 2

  Run a command "pidof emacs || emacs &" via os.system() function.

- Ctrl + Mod1 + 3

  Run a command "pidof firefox || firefox &" via os.system() function.

- Ctrl + Mod1 + 6 -- Ctrl + Mod1 + 9, Ctrl + Mod1 + 0

  Run a ssh command with different arguments.  Edit according to your environment.

- Mod1 + F1 -- Mod1 + F4

  Switch to the virtual screen 1--4, respectively.

- Shift + F5 -- Shift + F12

  Run a shell command.  Edit according to your environment.

- Ctrl + Mod1 + Delete

  Restart xpywm.

- Ctrl + Mod1 + =

  Terminate xpywm.

# AVAILABILITY

The latest version of **ansiterm** module is available at PyPI
(https://pypi.org/project/xpywm/) .

# SEE ALSO

twm(1), perlwm(1), pwm(1), xpymon(1), xpylog(1)

# AUTHOR

Hiroyuki Ohsaki <ohsaki[atmark]lsnl.jp>
