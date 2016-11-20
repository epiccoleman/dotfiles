#!/bin/bash

echo "gem: --user-install" > $HOME/.gemrc

gem install homesick

homesick clone epiccoleman/dotfiles
homesick symlink dotfiles
