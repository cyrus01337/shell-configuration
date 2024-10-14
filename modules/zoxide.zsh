#!/usr/bin/env zsh
if which zoxide &> /dev/null; then
    eval "$(zoxide init --cmd cd zsh)"
fi
