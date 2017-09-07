#!/bin/bash

# this script is only known to work on Ubuntu 17.04

dotfiles_repo_dir=${HOME}/.homesick/repos/dotfiles

sudo cp ${dotfiles_repo_dir}/profont/ProFontWindows.ttf /usr/share/fonts/truetype
sudo fc-cache -f -v
