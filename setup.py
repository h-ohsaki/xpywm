#!/usr/bin/env python3

# https://docs.python.org/3.6/distributing/index.html
# https://setuptools.readthedocs.io/en/latest/setuptools.html#developer-s-guide
# https://pypi.org/pypi?%3Aaction=list_classifiers

import setuptools

with open('README.md', 'r') as fh:
    long_description = fh.read()

setuptools.setup(
    name='xpywm',
    version='1.0',
    author='Hiroyuki Ohsaki',
    author_email='ohsaki@lsnl.jp',
    description='A simple but extensible X11 window manager written in Python',
    long_description=long_description,
    long_description_content_type='text/markdown',
    url='https://github.com/h-ohsaki/xpywm.git',
    packages=setuptools.find_packages(),
    install_requires = ['Xlib'],
    scripts=['xpywm'],
    classifiers=[
        'Programming Language :: Python :: 3.7',
        'License :: OSI Approved :: GNU General Public License v3 or later (GPLv3+)',
        'Operating System :: POSIX',
    ],
)
