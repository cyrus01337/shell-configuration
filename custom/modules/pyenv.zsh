#!/usr/bin/env bash
export PYENV_ROOT="$HOME/.local/pyenv"
export PYENV_VIRTUALENV_DISABLE_PROMPT=true
VENV_ACTIVATION_SCRIPT=".venv/bin/activate"

if [[ -d "$PYENV_ROOT" ]]; then
    export PATH="$PYENV_ROOT/bin:$PATH"

    eval "$(pyenv init -)" &> /dev/null
    eval "$(pyenv virtualenv-init -)" &> /dev/null
elif [[ -f $VENV_ACTIVATION_SCRIPT ]]; then
    source $VENV_ACTIVATION_SCRIPT
fi

