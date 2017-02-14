#!/bin/bash

install() {
    vim -c ":PlugUpdate"
}

for cmd in "$@"; do $cmd; done
