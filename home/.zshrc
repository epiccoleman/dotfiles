# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# turn on prompt system
autoload -U promptinit && promptinit
prompt pure

export fpath=( "$HOME/.zfunctions" $fpath )

# history settings
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE="~/.zsh-history"

# aliases and functions
alias ll="ls -alh"
alias l="ls"
alias code="cd ~/code"
alias nuke="rm -rf" 
alias servdir="python -m SimpleHTTPServer 8080"
alias servedir="servdir"
alias untar="tar -xvzf"
alias lip="localip"
alias eip="externalip"
alias clr="clear"
alias dotfiles="cd ~/.homesick/repos/dotfiles"
alias clone="quick-clone"
alias cask="brew cask"

function quick-clone {
    local clone_url=${1}
    local target_dir=${2}

    if [[ ! $clone_url =~ "\/" ]]; then
        git clone http://github.com/epiccoleman/${clone_url} ${target_dir}
    else
        git clone http://github.com/${clone_url} ${target_dir}
    fi
}

function mkcd {
    mkdir $1
    cd $1
    echo "You are in: " 
    pwd
}

function xa {
    clear
    cd    
}

function localip {
    ifconfig | grep 192 | cut -d ' ' -f 12 | cut -d ':' -f 2
}

function externalip {
    curl http://checkip.amazonaws.com/
}

function idea {
    if [ -z $1 ]; then
        vim ~/ideas.md 
    else
        date >> ~/ideas.md
        echo $1 >> ~/ideas.md
    fi
}

export EDITOR=/usr/bin/vim
local_gems_dir=${HOME}/.gem/ruby/2.0.0/bin
export PATH=${PATH}:${local_gems_dir}:/usr/local/bin

#enable colors for iterm2
export CLICOLOR=1
export TERM=xterm-256color
