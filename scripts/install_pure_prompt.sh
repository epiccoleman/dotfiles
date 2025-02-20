#!/bin/bash

# this is the dumbest way of getting the path but it's fine if all you want to do is make
# sure that execution happens in the dir where the script lives and you won't be using
# symlinks
CASTLE_PATH="$(dirname $0)/.."

cd $CASTLE_PATH

git submodule init
git submodule update

pushd pure-zsh-prompt
git pull origin main
git checkout main
popd

ln -sf $PWD/pure-zsh-prompt $HOME/.zsh/pure
