#!/bin/bash

source ./_utils.sh

is_installed=$(install_if_unavilable nodejs)

if [[ $is_installed == "" ]]; then
    sudo pacman -S --noconfirm nodejs
fi
