#!/bin/bash

if [[ ! -d "${HOME}/.rbenv" ]]; then
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    cd "${HOME}/.rbenv" && src/configure && make
fi
