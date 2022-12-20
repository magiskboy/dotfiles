#!/bin/bash

source ./_utils.sh

is_installed=$(install_if_unavailable python)

if [[ $is_installed == "" ]]; then
    sudo pacman -S --noconfirm python3
fi
