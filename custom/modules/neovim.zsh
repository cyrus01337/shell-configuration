#!/usr/bin/env zsh
NEOVIM_CONFIGURATION_DIRECTORY="$HOME/.config/nvim"

if which nvim &> /dev/null; then
    n() {
        original_directory="$PWD"
        object_to_edit="${1:-$NEOVIM_CONFIGURATION_DIRECTORY}"
        object_directory="$(dirname $object_to_edit)"

        if [[ -d "$object_to_edit" ]]; then
            object_directory="$object_to_edit"
            object_to_edit="."
        else
            object_to_edit="$(basename $object_to_edit)"
        fi

        cd "$object_directory"
        nvim "$object_to_edit"
        cd "$original_directory"
    }
fi
