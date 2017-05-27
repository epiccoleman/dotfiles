#!/bin/bash

# this script is only known to work on Ubuntu 17.04

cp ../profont/ProFontWindows.ttf /usr/share/fonts/truetype
sudo fc-cache -f -v
