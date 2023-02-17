#!/bin/bash

# ========================= Environment variables =====================
export OS=$(uname -s | tr "[:upper:]" "[:lower:]")
export PATH=$HOME/.local/go/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PYTHONDONTWRITEBYTECODE=1
export GOPATH=$HOME/Development/go
export GOROOT=$HOME/.local/go
export TERM=screen-256color
export TERMINFO=/usr/share/terminfo
export PYENV_ROOT="$HOME/.pyenv"
export PATH=$PYENV_ROOT/bin:$PATH
export PATH=$PYENV_ROOT/shims:$PATH
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
export VIRTUAL_ENV_DISABLE_PROMPT=1
export OPENSSL_CONF=/etc/ssl/           # fix: vagrant not found openssl lib

# =============================== Alias =====================================
alias ll="ls -lh"
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gb="git branch"
alias gba="git branch -a"
alias gc="git commit -v"
alias gc!="git commit -v --amend"
alias gcn!="git commit -v --no-edit --amend"
alias gd="git diff"
alias gco="git checkout"
alias gf="git fetch"
alias gst="git status"
alias update-system="sudo pacman -Suy  --noconfirm && sudo reboot"

source "$HOME/.cargo/env"
. "$HOME/.cargo/env"
