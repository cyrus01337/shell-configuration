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
    # if [[ -f "package-lock.json" ]]; then
    #     PROJECT_LANGUAGE="javascript"
    #     P_PACKAGE_MANAGER="npm"
    #     PX_COMMAND="npx"
    # elif [[ -f "yarn.lock" ]]; then
    #     PROJECT_LANGUAGE="javascript"
    #     P_PACKAGE_MANAGER="yarn"
    #     PX_COMMAND="yarn dlx"
    # elif [[ -f "pnpm-lock.yaml" ]]; then
    #     PROJECT_LANGUAGE="javascript"
    #     P_PACKAGE_MANAGER="pnpm"
    #     PX_COMMAND="pnpx"
    # elif [[ -f "deno.lock" ]]; then
    #     PROJECT_LANGUAGE="javascript"
    #     P_PACKAGE_MANAGER="deno"
    #     PX_COMMAND="deno run"
    # elif [[ -f "bun.lockb" ]]; then
    #     PROJECT_LANGUAGE="javascript"
    #     P_PACKAGE_MANAGER="bun"
    #     PX_COMMAND="bunx"
    # fi

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
