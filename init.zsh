#!/usr/bin/env zsh
. $ZDOTDIR/setup-zim.zsh

if [[ ! $RAN_BEFORE_SCRIPTS ]]; then
    for script in $ZDOTDIR/before/*.zsh; do
        . $script
    done

    RAN_BEFORE_SCRIPTS=true
fi

for module in $ZDOTDIR/modules/*.zsh; do
    . $module
done

for package in $ZDOTDIR/packages/*/; do
    package_name=$(basename $package)

    . "$package/${package_name}.zsh"
done

for aliases_ in $ZDOTDIR/aliases/*.zsh; do
    . $aliases_
done
