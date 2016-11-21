#!/bin/bash

echo "gem: --user-install" > $HOME/.gemrc

gem install homesick

homesick clone epiccoleman/dotfiles
homesick symlink dotfiles --force

dotfiles_repo_dir=${HOME}/.homesick/repos/dotfiles

$dotfiles_repo_dir/install_pure_prompt.sh
