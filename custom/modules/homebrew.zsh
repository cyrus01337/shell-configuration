#!/usr/bin/env bash
export HOMEBREW_NO_ENV_HINTS=true
HOMEBREW_DIRECTORY="/home/linuxbrew"

if [[ -d $HOMEBREW_DIRECTORY ]] && which brew &> /dev/null; then
    eval "$($HOMEBREW_DIRECTORY/.linuxbrew/bin/brew shellenv)"
fi

