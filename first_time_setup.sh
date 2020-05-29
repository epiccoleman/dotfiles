#!/bin/bash

dotfiles_repo_dir=${HOME}/.homesick/repos/dotfiles
script_dir=${dotfiles_repo_dir}/scripts

git clone https://github.com/epiccoleman/homeshick.git ${HOME}/.homesick/repos/homeshick

source ${HOME}/.homesick/repos/homeshick/homeshick.sh

homeshick clone epiccoleman/dotfiles
homeshick symlink dotfiles --force

${script_dir}/install_pure_prompt.sh
${script_dir}/install_vim_plug.sh

# Interactive steps below this line
${script_dir}/vim_plugins.sh install
${script_dir}/generate_ssh_key.sh

echo "All done. You should go add your ssh key to github."
