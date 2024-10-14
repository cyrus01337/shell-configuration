#!/usr/bin/env zsh
ZSHRC_PATH="$ZDOTDIR/.zshrc"

alias lsa="ls -a"
alias lsal="ls -al"
alias lsl="ls -l"
alias q="exit"
alias r="clear && . $ZSHRC_PATH"
alias schmod="sudo chmod"
alias schown="sudo chown"
alias sshq="ssh -q"
alias scpq="scp &> /dev/null"

edit() {
    original_directory="$PWD"
    target="$1"

    if [[ -d $target ]]; then
        cd $target
    else
        cd $(dirname $target)
    fi

    command $EDITOR $1
    cd $original_directory
}

alias z="edit $ZDOTDIR/ && . $ZSHRC_PATH"
