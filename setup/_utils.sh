#!/bin/bash

search_pkg() {
    pacman -Q | sed "s|\(.*\) \(.*\)|\1|" | grep -Fx $@
}

unavailable() {
    pkgs=""
    for pkg in $@; do
        if [[ $(search_pkg $pkg) == "" ]]; then
            pkgs="$pkgs $pkg"
        fi
    done
    echo "$pkgs" | sed 's/^.//'
}

install_if_unavailable() {
    unavailable_packages=$(unavailable $@)
    echo $unavailable_packages

    if [[ $unavailable_packages != "" ]]; then
        echo "Installing $unavailable_packages"
        sudo pacman -S --noconfirm $unavailable_packages
    fi
}
