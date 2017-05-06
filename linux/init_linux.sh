#!/bin/bash

# set default shell to zsh
if which zsh > /dev/null; then
    chsh -s $(which zsh) 
fi
