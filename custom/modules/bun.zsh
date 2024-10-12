#!/usr/bin/env bash
if [[ -s "$HOME/.bun/_bun" ]]; then
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$PATH:$BUN_INSTALL/bin"

    source "$HOME/.bun/_bun"
fi

