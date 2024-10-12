#!/usr/bin/env bash
if which flatpak &> /dev/null; then
    export PATH="/var/lib/flatpak/exports/bin:$PATH"
fi
