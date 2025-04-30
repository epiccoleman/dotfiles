#!/bin/bash

# This script configures certain OSX settings

# allow ssh
sudo systemsetup -setremotelogin on
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write KeyRepeat 2
defaults write InitialKeyRepeat 25
