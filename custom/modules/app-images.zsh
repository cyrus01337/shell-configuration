#!/usr/bin/env zsh
APP_IMAGES_DIRECTORY="$HOME/Applications"

if [[ -d "$APP_IMAGES_DIRECTORY" ]]; then
    export PATH="$APP_IMAGES_DIRECTORY:$PATH"
fi
