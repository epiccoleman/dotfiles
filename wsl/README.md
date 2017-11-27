# What I Did To Set Up WSL

## Making Terminal Pretty
* Using WSLtty - not like, loyal to this thing, it's OK for now. Paste hotkey blows.
* I'm using this Solarized theme: https://github.com/mavnn/mintty-colors-solarized 
* You put the config into .minttyrc which lives at `%LOCALAPPDATA%\wsltty\home\%USERNAME%\.minttyrc`
* In the case of my current box that means `C:\Users\Eric\AppData\Local\wsltty\home\Eric\.minttyrc`
* Set up ProFont in the right click options menu. also have it set in minttyrc but idk if it works or not,
because the gui seems to take precedence. whatever.

# ZSH 
WSL is on the Trusty sources, which means it's got some outdated ass packages. In particular, the version of 
zsh wasn't compatible with my zshrc due to a bug.

I added the xenial sources to my sources.list and used that to install zsh-5.1.1 which fixes that problem. It replaced a lot of shit on the system with newer versions, so idk if that will have any unwanted side effects.

After that, I pretty much just ran some of the individual scripts that first_time_setup.sh and linux/init_linux.sh run. This is now a pretty damn decent Linux terminal running natively on my Windows box. 

Also, I installed tmux. Works fine. It's version 1.8 though which is annoying.
Also, I installed fzf. Works great. 
