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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source this blindly because i want it to error if it's not there
source ~/.common-shell-profile
