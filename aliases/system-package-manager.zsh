#!/usr/bin/env zsh
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
alias spi="$package_manager install $DEFAULT_PACKAGE_MANAGER_FLAGS"
alias spr="$package_manager remove $DEFAULT_PACKAGE_MANAGER_FLAGS"
alias spu="$package_manager update $DEFAULT_PACKAGE_MANAGER_FLAGS"
alias spup="$package_manager upgrade $DEFAULT_PACKAGE_MANAGER_FLAGS"
alias spp="$package_manager purge"
alias spar="$package_manager autoremove $DEFAULT_PACKAGE_MANAGER_FLAGS"

if exists apt-get; then
    alias spdup="$package_manager dist-upgrade $DEFAULT_PACKAGE_MANAGER_FLAGS"
    alias spdapr="$repository_manager $DEFAULT_REPOSITORY_MANAGER_FLAGS"
    alias spdrpr="$repository_manager $DEFAULT_REPOSITORY_MANAGER_FLAGS --remove"
elif exists dnf; then
    alias spdup="$package_manager upgrade $DEFAULT_PACKAGE_MANAGER_FLAGS"
    alias spdapr="$repository_manager enable $DEFAULT_REPOSITORY_MANAGER_FLAGS"
    alias spdrpr="$repository_manager remove $DEFAULT_REPOSITORY_MANAGER_FLAGS"
fi
