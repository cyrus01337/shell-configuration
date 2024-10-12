#!/usr/bin/env zsh
export GITHUB_USERNAME="cyrus01337"

if which git &> /dev/null; then
    alias g="git"
    alias ga="g add ${@:-.}"
    alias gb="g branch"
    alias gch="g checkout"
    alias gcl="g clone"
    alias gco="g commit"
    alias gi="g init"
    alias gm="g merge"
    alias gr="g remote"
    alias gra="gr add"
    alias gpl="g pull"
    alias gps="g push"
    alias gpsu="gps -u origin ${1:-main}"
    alias gsm="g submodule"

    alias fix-formatting-commit="pf && ga && gco -m 'Fix formatting' && gps"
    # TODO: Unify all Git-related binaries and commands into 1 module
    alias git-init-submodule="gsm update --init --recursive"
    alias git-update-submodule="gsm update --recursive --remote"
    alias gism="git-submodule-initialise"
    alias gusm="git-submodule-update"
fi
