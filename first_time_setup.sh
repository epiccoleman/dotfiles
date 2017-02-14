#!/bin/bash

dotfiles_repo_dir=${HOME}/.homesick/repos/dotfiles
script_dir=${dotfiles_repo_dir}/scripts

# sets up ruby gems to install to home dir 
# (no need for sudo on `gem install`)
echo "gem: --user-install" > $HOME/.gemrc

gem install homesick
homesick clone epiccoleman/dotfiles
homesick symlink dotfiles --force

${script_dir}/install_pure_prompt.sh
${script_dir}/install_vim_plug.sh

# Interactive steps below this line 
${script_dir}/vim_plugins.sh install 
