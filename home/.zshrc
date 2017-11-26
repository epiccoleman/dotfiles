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
# prompt char is green normally and red after a failed command
PROMPT=%(?.%F{green}.%F{red})${PURE_PROMPT_SYMBOL:-❯ }%f

# history settings
export HISTFILE=~/.zsh-history
export HISTSIZE=1000
export SAVEHIST=1000

# use vi style line editor
bindkey -v
# use jk to get to 'normal mode'
bindkey -M viins 'jk' vi-cmd-mode
# bind ^R to search for when you forget about vi mode
bindkey '^R' history-incremental-search-backward
bindkey '^N' insert-last-word

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
alias homesick="homeshick"
alias t='tmux'
alias tl='tmux list-sessions'
alias gs='git status'
alias gits="git"

function quick-clone {
    local clone_url=${1}
    local target_dir=${2}

    if [[ ! $clone_url =~ "\/" ]]; then
        git clone http://github.com/epiccoleman/${clone_url} ${target_dir}
    else
        git clone http://github.com/${clone_url} ${target_dir}
    fi
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

function ta {
    local session="$1"
    if [[ -z "$session" ]]; then
        tmux attach
    else
        tmux attach -t "$session"
    fi
}

function ts {
    local session="$1"
    if [[ -z "$session" ]]; then
        tmux
    else
        tmux new-session -s "$session"
    fi
}

function tk {
    local session="$1"
    if [[ ! -z "$session" ]]; then
        # this is zsh read syntax - will have to adjust to use for bash
        read "response?Kill session: $session [Y/n]? "
        response=${response}
        if [[ $response =~ ^(yes|y|Y| ) ]] | [ -z $response ]; then
            tmux kill-session -t "$session"
        fi
    fi
}

export EDITOR=/usr/bin/vim
local_gems_dir=${HOME}/.gem/ruby/2.0.0/bin
export PATH=${PATH}:${local_gems_dir}:/usr/local/bin

#enable colors for iterm2
export CLICOLOR=1
export TERM=xterm-256color

# source tool specific scripts
[ -f ~/.homesick/repos/homeshick/homeshick.sh ] && source ~/.homesick/repos/homeshick/homeshick.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source a non-vc'ed profile for machine-specific stuff (this should be pretty short)
# this should be at the end so that stuff can be overridden here
# this should be at the end of the profile, because rbenv wants to
# be at the front of the path variable (so it can have precedence)
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
[ -f ~/.system-specific-profile ] && source ~/.system-specific-profile
