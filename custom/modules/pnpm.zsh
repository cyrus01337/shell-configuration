#!/usr/bin/env zsh
export PNPM_HOME="$HOME/.local/share/pnpm"

if [[ -d "$PNPM_HOME" ]]; then
    export PATH="$PNPM_HOME:$PATH"
fi
