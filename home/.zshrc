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

alias t="todo.sh -d ~/.todo/todo.cfg"

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
export fpath=( "$HOME/.zfunctions" $fpath )

# turn on prompt system
autoload -U promptinit && promptinit
prompt pure


#enable colors for iterm2
export CLICOLOR=1
export TERM=xterm-256color
