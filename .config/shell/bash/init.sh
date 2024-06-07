#!/usr/bin/env bash

export \
    MCFLY_PROMPT="❯" \
    MCFLY_DISABLE_MENU="true" \
    MCFLY_KEY_SCHEME="vim" \
    MCFLY_FUZZY=2 \
    MCFLY_RESULTS=50 \
    MCFLY_INTERFACE_VIEW="bottom"
eval "$(mcfly init bash)"
eval "$(zoxide init bash)"
eval "$(starship init bash)"
