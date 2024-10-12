#!/usr/bin/env bash
# https://medium.com/@chantastic/p-525e68f17e56
FILE="${(%):-%x}"
P_DIRECTORY=$(dirname $FILE)
PROJECT_LANGUAGE=""
P_PACKAGE_MANAGER=""
PX_COMMAND=""
SUPPORTED_LANGUAGES=(
    "javascript"
)

auto_detect_package_manager() {
    for language in $SUPPORTED_LANGUAGES; do
        loader_found="detect_${language}"

        . "$P_DIRECTORY/loaders/${language}.zsh"

        executables=($($loader_found))

        if [[ $? == 0 ]]; then
            PROJECT_LANGUAGE=$language
            # Despite arrays in Bash being zero-indexed, the 0th element refuses
            # to exist for reasons I am humanly fucking incapable of
            # understanding - if someone knows why, please reach out as this
            # feels like a reach in itself
            P_PACKAGE_MANAGER="${executables[1]}"
            PX_COMMAND="${executables[2]}"

            break
        fi
    done
}

p() {
    command $P_PACKAGE_MANAGER $@
}

px() {
    if [[ $PROJECT_LANGUAGE = "javascript" ]]; then
        command $PX_COMMAND $@
    fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd auto_detect_package_manager
auto_detect_package_manager
