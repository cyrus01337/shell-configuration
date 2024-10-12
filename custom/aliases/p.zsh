#!/usr/bin/env zsh
alias pin="p install"
alias pa="p add"
alias pad="pa -D"
alias prm="p remove"
alias pup="p update"
alias pst="p run start"
alias pd="p run dev"
alias pf="p format"
alias pln="p lint"
alias pt="p run test"

pb() {
    if [[ -f bun.lockb ]]; then
        NODE_ENV=production p run build "$@"
    else
        p run build "$@"
    fi
}

pci() {
    if [[ -f bun.lockb || -f pnpm-lock.yaml ]]; then
        p install --frozen-lockfile
    else
        p ci
    fi
}
