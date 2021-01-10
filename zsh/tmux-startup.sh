#!/usr/bin/env zsh


TERM=screen-256color-bce tmux new-session -d -s main;

tmux send 'eval "$(pyenv init - --no-rehash)"' ENTER;
tmux send 'eval "$(pyenv virtualenv-init - --no-rehash)"' ENTER;

tmux send 'clear' ENTER;

tmux a -t main;
