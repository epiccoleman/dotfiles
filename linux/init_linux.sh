#!/bin/bash

dotfiles_repo_dir=${HOME}/.homesick/repos/dotfiles
script_dir=${dotfiles_repo_dir}/scripts

${dotfiles_repo_dir}/linux/install-apt-packages.sh
${dotfiles_repo_dir}/linux/install-profont.sh

# set default shell to zsh
if which zsh > /dev/null; then
    chsh -s $(which zsh)
fi

# do it this way so i don't have to vc the bashrc that ships with ubuntu
echo "source ~/.common-shell-profile >> ~/.bashrc"

source ~/.homesick/repos/homeshick/homeshick.sh
homeshick clone dotfiles-xubuntu-vm
homeshick symlink dotfiles-xubuntu-vm
