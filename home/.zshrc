setopt autocd extendedglob
unsetopt beep
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -z edit-command-line
zle -N edit-command-line

# glares at zsh
[ -f $HOME/.asdf/asdf.sh ] && \
    source $HOME/.asdf/asdf.sh
#
# this needs to happen before prompt system init
export fpath=("$HOME/.asdf/completions" "$HOME/.zsh/completion" "$HOME/.zsh/pure" $fpath )

# turn on completion system
autoload -Uz compinit && compinit
# turn on prompt system
autoload -U promptinit && promptinit

prompt pure
# prompt char is green normally and red after a failed command
zstyle ':prompt:pure:prompt:success' color green

# history settings
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
#HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt incappendhistory #Immediately append to the history file, not just when a term is killed


# use vi style line editor
bindkey -v
# use jk to get to 'normal mode'
bindkey -M viins 'jk' vi-cmd-mode

bindkey -M vicmd 'V' edit-command-line
# bind ^R to search for when you forget about vi mode
bindkey '^R' history-incremental-search-backward
bindkey '^N' insert-last-word
bindkey '^J' down-history
bindkey '^K' up-history
bindkey '^E' vi-end-of-line
bindkey '^A' vi-beginning-of-line

# fixes weird delete behavior, probably osx/macbook specific?
# https://superuser.com/questions/997593/why-does-zsh-insert-a-when-i-press-the-delete-key
bindkey "^[[3~" delete-char

function tk {
    local session="$1"
    if [[ ! -z "$session" ]]; then
        # this is zsh read syntax - will have to adjust to use for bash
        read "response?Kill session: $session [Y/n]? "
        response=${response}
        if [[ $response =~ ^[Yy]$ ]] | [ -z $response ]; then
            tmux kill-session -t "$session"
        fi
    fi
}

function gitignore {
    if [[ -f .gitignore ]]; then
        echo "${1}" >> .gitignore
    else
        read "response?.gitignore does not exist, create it [Y/n]?"
        echo
        if [[ $response =~ ^[Yy]$ ]]
        then
            echo "${1}" >> .gitignore
        else
            echo "OK, not creating .gitignore"
        fi
    fi
}

alias sbrc='source ~/.zshrc'

[ -f $HOME/.fzf.zsh ] && \
    source $HOME/.fzf.zsh


# source this blindly because i want it to error if it's not there
source ~/.common-shell-profile

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/eric/.sdkman"
[[ -s "/Users/eric/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/eric/.sdkman/bin/sdkman-init.sh"
