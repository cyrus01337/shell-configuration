#!/usr/bin/env bash
DEFAULT_PACKAGE_MANAGER_FLAGS="-y"
DEFAULT_REPOSITORY_MANAGER_FLAGS="-y"

package_manager=""
repository_manager=""

exists() {
    which $1 &> /dev/null
}

if exists apt-get; then
    if exists apt-fast; then
        package_manager="sudo apt-fast"
    elif exists nala; then
        package_manager="sudo nala"
    else
        package_manager="sudo apt-get"
    fi

    repository_manager="sudo add-apt-repository"
elif exists dnf; then
    package_manager="sudo dnf"
    repository_manager="sudo dnf copr"
fi

alias sp="$package_manager"
alias spi="$package_manager install"
alias spr="$package_manager remove"
alias spu="$package_manager update"
alias spup="$package_manager upgrade"
alias spp="$package_manager purge"
alias spar="$package_manager autoremove"

if exists apt-get; then
    alias spdup="$package_manager dist-upgrade"
    alias spdapr="$repository_manager"
    alias spdrpr="$repository_manager --remove"
elif exists dnf; then
    alias spdup="$package_manager upgrade"
    alias spdapr="$repository_manager enable"
    alias spdrpr="$repository_manager remove"
fi

