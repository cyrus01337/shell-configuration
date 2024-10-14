#!/usr/bin/env zsh
. $ZDOTDIR/setup-zim.zsh

if [[ ! $RAN_BEFORE_SCRIPTS ]]; then
    for script in $ZDOTDIR/before/*.zsh; do
        . $script
    done

    RAN_BEFORE_SCRIPTS=true
fi

if [[ ! $INITIALISED_MODULES ]]; then
    for module in $ZDOTDIR/modules/*.zsh; do
        . $module
    done

    INITIALISED_MODULES=true
fi

if [[ ! $INITIALISED_PACKAGES ]]; then
    for package in $ZDOTDIR/packages/*/; do
        package_name=$(basename $package)

        . "$package/${package_name}.zsh"
    done

    INITIALISED_PACKAGES=true
fi

if [[ ! $INITIALISED_ALIASES ]]; then
    for aliases_ in $ZDOTDIR/aliases/*.zsh; do
        . $aliases_
    done

    INITIALISED_ALIASES=true
fi
