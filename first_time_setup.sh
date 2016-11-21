#!/bin/bash

dotfiles_repo_dir=${HOME}/.homesick/repos/dotfiles

echo "gem: --user-install" > $HOME/.gemrc

$dotfiles_repo_dir/install_vim_plug.sh

gem install homesick

homesick clone epiccoleman/dotfiles
homesick symlink dotfiles --force

$dotfiles_repo_dir/install_pure_prompt.sh
