#!/usr/bin/env bash
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
    command $EDITOR $@
}

alias z="edit $ZDOTDIR/ && . $ZSHRC_PATH"
