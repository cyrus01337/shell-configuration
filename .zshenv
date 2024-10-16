export ZDOTDIR="$HOME/.config/zsh"
export ZELLIJ_ZSH_AUTO_ATTACH=true
export ZELLIJ_ZSH_SESSION_NAME="main"

if [ -d "$HOME/.cargo/" ]; then
    source "$HOME/.cargo/env"
fi
