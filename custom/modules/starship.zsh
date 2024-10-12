#!/usr/bin/env bash
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

if which starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

