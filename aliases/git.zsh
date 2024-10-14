#!/usr/bin/env zsh
if which git &> /dev/null; then
    alias g="git"
    alias ga="git add ${@:-.}"
    alias gb="git branch"
    alias gch="git checkout"
    alias gcl="git clone"
    alias gco="git commit"
    alias gi="git init"
    alias gm="git merge"
    alias gr="git remote"
    alias gra="git remote add"
    alias gpl="git pull"
    alias gps="git push"
    alias gpsu="git push -u origin ${1:-main}"
    alias gsm="git submodule"

    alias fix-formatting-commit="p format && git add . && git commit -m 'Fix formatting' && git push"
    # TODO: Unify all Git-related binaries and commands into 1 module
    alias git-init-submodule="git submodule update --init --recursive"
    alias git-update-submodule="git submodule update --recursive --remote"
    alias gism="git-submodule-initialise"
    alias gusm="git-submodule-update"
fi
