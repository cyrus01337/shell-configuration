#!/usr/bin/env bash
. $ZDOTDIR/setup-zim.zsh

if [[ ! $INITIALISED_MODULES ]]; then
    for module in $ZDOTDIR/custom/modules/*.zsh; do
        . $module
    done

    INITIALISED_MODULES=true
fi

if [[ ! $INITIALISED_PACKAGES ]]; then
    for package in $ZDOTDIR/custom/packages/*/; do
        package_name=$(basename $package)

        . "$ZDOTDIR/custom/packages/$package_name/${package_name}.zsh"
    done

    INITIALISED_PACKAGES=true
fi

if [[ ! $INITIALISED_ALIASES ]]; then
    for aliases_ in $ZDOTDIR/custom/aliases/*.zsh; do
        . $aliases_
    done

    INITIALISED_ALIASES=true
fi
