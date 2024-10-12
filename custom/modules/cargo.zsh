#!/usr/bin/env bash
CARGO_PATH="$HOME/.cargo"

if [[ -d $CARGO_PATH ]]; then
    source "$CARGO_PATH/env"
fi

