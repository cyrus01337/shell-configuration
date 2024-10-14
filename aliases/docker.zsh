#!/usr/bin/env zsh
if which docker &> /dev/null; then
    alias d="docker"
    alias dc="docker compose"
    alias dcb="dc build"
    alias dcr="dc down && dc up"
    alias docker-images="docker image ls"
fi

