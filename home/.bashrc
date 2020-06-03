function tk {
    local session="$1"
    if [[ ! -z "$session" ]]; then
        read -r -p "Kill session: ${session}? [Y/n]" response
        response=${response,,}    # tolower
        if [[ $response =~ ^(yes|y|Y| ) ]] | [[ -z $response ]]; then
            tmux kill-session -t "$session"
        fi
    fi
}

function gitignore {
    if [[ -f .gitignore ]]; then
        echo "${1}" >> .gitignore
    else
        read -p ".gitignore does not exist, create it [Y/n]? " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            echo "${1}" >> .gitignore
        else
            echo "OK, not creating .gitignore"
        fi
    fi
}
#shopt -s globstar
#shopt -s nullglob
#shopt -s extglob

alias sbrc="source ~/.bashrc"

# source this blindly because i want it to error if it's not there
source ~/.common-shell-profile

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
