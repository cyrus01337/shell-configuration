#!/usr/bin/env zsh
CARGO_PATH="$HOME/.cargo"

if [[ -d $CARGO_PATH ]]; then
    source "$CARGO_PATH/env"
fi
