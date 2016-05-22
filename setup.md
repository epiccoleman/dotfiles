# Setup Dev Machine
 
Wed Mar  8 20:00:00 EST 2016

Download xubuntu 15.10
Create vm (1G RAM, 16 HD)

sudo apt-get install openjdk-8-jre-headless
sudo apt-get install vim
sudo apt-get install tmux
sudo apt-get install virtualbox-guest-dkms
sudo apt-get install virtualbox-guest-utils virtualbox-guest-x11
sudo apt-get install openssh-server


ssh-keygen
ssh-copy-id 192.168.0.10
ssh 192.168.0.10

set PermitRootLogin and PasswordAuthentication to no in /etc/ssh/sshd_config

https://thepcspy.com/read/making-ssh-secure/

use ssh to scp over bash profile and vimrc from mac

sudo apt-get install curl

sudo apt-get instal git
install vim pathogen

cider-nrepl
vim-fireplace
vim-clojure-static
vim-solarized

install terminator
change Settings Manager >> Preferred Applications >> Utilities
to make terminator the default
installed terminator solarized

install leiningen

Wed Mar  9 20:04:42 EST 2016

umm..
http://www.slideshare.net/jaguardesignstudio/why-zsh-is-cooler-than-your-shell-16194692

also http://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/

set zsh to default sh
chsh -s /bin/zsh - taht was enough

moved bash_profile into .zshrc
now need tmux to use zsh as def shell

added this to tmux.conf
set-option -g default-shell /bin/zsh

ok. so i have all the buzzwordy hip tools at this point:
xubuntu
Clojure
zsh
vim
tmux
git 

now i just need to start writing code. also will probably do more to configure tmux and zsh. and, i need to put my dotfiles under vc.

http://todotxt.com/
this looks cool. gonna try it out too.

setting up with the instructions here https://github.com/ginatrapani/todo.txt-cli/wiki/Quick-Start-Guide

putting script in /usr/bin. default config file is ~/.todo/config so we'll use that for now. also install completion, and use that thing to reflect the alias. wonder if that would work forthe dm/docker machine shit at work.

tmux mouse mode
gonna use:
set -g mode-mouse on
set -g mouse-resize-pane on
set -g mouse-select-pane on

that seems to work pretty good (this is awesome actually)

i'm going to start tracking todo items with todo.sh, so this file should potentially only be updated when i actually make changes. with the setup i have so far, i shouldn't need to do as much of that 


Thu Mar 10 20:58:09 EST 2016

https://github.com/sindresorhus/pure


Fri Mar 18 19:08:37 EDT 2016

set terminator title bar color to #859900 (solarized green, not sure i'll keep this)

apt get install tree


Thu Mar 24 20:44:24 EDT 2016

So I've got pure zsh prompt as a submodule in this dotfiles repo. next, installing it. i'm doing manual installation to avoid having to install npm. symlinking into ~/.zfunctions
```
$ ln -s "$PWD/pure.zsh" "$HOME/.zfunctions/prompt_pure_setup"
$ ln -s "$PWD/async.zsh" "$HOME/.zfunctions/async"
```

also gotta add the thing to .zshrc

ok, added thing. set my font to droid sans 13 pt. looks good man. 


Sun May  1 12:55:45 EDT 2016

install rvm according to instructions on their site
gem install bundler
git config --global core.editor=/usr/bin/vim
http://stackoverflow.com/questions/15817661/vim-wrong-indentation
git config --global push.default simple


Sun May 15 16:08:11 EDT 2016
Added cron git backup to todo.sh - every 5 minutes todo.txt will sync with git
 
gem install homesick

