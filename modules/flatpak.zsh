#!/usr/bin/env zsh
if which flatpak &> /dev/null; then
    export PATH="/var/lib/flatpak/exports/bin:$PATH"
fi
