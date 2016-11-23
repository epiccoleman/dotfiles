#!/bin/bash

install() {
    vim -c ":PlugUpdate"
}

for arg in "$@"; do $arg; done
