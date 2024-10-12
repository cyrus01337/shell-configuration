#!/usr/bin/env zsh
export AUTO_UPDATE_CHEZMOI_SERVICE="$HOME/.config/systemd/user/chezmoi.service"

if (
    (
        which systemctl &> /dev/null \
            && ! systemctl --user is-enabled --quiet chezmoi.service
    ) \
        && [[ -f $AUTO_UPDATE_CHEZMOI_SERVICE && ! -f "/.dockerenv" ]]
); then
    echo "chezmoi auto-update service found, don't forget to enable it with \"systemctl --user enable --now chezmoi.service\""
fi
