#!/bin/bash

source ./_utils.sh

is_installed=$(install_if_unavailable clang)

if [[ $is_installed == "" ]]; then
    sudo pacman -S --noconfirm clang 1>/dev/null
fi
