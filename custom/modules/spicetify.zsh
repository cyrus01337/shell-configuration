#!/usr/bin/env bash
SPICETIFY_PATH="$HOME/.spicetify"

if [[ -d $SPICETIFY_PATH ]]; then
    export PATH="$PATH:$SPICETIFY_PATH"
fi

