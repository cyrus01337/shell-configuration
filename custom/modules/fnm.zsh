#!/usr/bin/env zsh
FNM_DIRECTORY="$HOME/.local/share/fnm"

if [[ -d "$FNM_DIRECTORY" ]]; then
    export PATH="$FNM_DIRECTORY:$PATH"

    eval "$(fnm env --use-on-cd --shell zsh)"
fi
