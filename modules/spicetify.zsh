#!/usr/bin/env zsh
SPICETIFY_PATH="$HOME/.spicetify"

if [[ -d $SPICETIFY_PATH ]]; then
    export PATH="$PATH:$SPICETIFY_PATH"
fi
