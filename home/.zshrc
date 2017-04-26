# Lines configured by zsh-newuser-install
setopt autocd extendedglob
unsetopt beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# this needs to happen before prompt system init
export fpath=( "$HOME/.zfunctions" $fpath )

# turn on prompt system
autoload -U promptinit && promptinit
prompt pure

# history settings
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE="~/.zsh-history"

# use vi style line editor
bindkey -v
# use jk to get to 'normal mode'
bindkey -M viins 'jk' vi-cmd-mode
# bind ^R to search for when you forget about vi mode
bindkey '^R' history-incremental-search-backward


# fixes weird delete behavior, probably osx/macbook specific?
# https://superuser.com/questions/997593/why-does-zsh-insert-a-when-i-press-the-delete-key
bindkey "^[[3~" delete-char

# aliases and functions
alias ll="ls -alh"
alias l="ls"
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
