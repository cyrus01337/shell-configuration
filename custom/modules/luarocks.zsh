#!/usr/bin/env zsh
if which luarocks &> /dev/null; then
    export PATH="$PATH:$HOME/.luarocks/bin"
fi
