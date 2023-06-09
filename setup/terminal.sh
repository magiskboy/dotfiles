#!/bin/bash

source ./_utils.sh

install_if_unavailable "nerd-fonts-hack starship exa alacritty ripgrep htop fzf pgcli zsh bat jq yq ranger ueberzug libtiff"
install_if_unavailable ""

if [[ ! -d $HOME/.ohmyzsh ]]; then
    echo "Installing oh-my-zsh..."
    git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh $HOME/.ohmyzsh && \
    git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions $HOME/.ohmyzsh/custom/plugins/zsh-autosuggestions && \
    git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.ohmyzsh/custom/plugins/zsh-syntax-highlighting && \
    git clone --depth 1 https://github.com/Aloxaf/fzf-tab $HOME/.ohmyzsh/custom/plugins/fzf-tab && \
    git clone --depth 1 https://github.com/agkozak/zsh-z $HOME/.phmyzsh/custom/plugins/zsh-z
fi

# Link dotfiles
rm -rf $HOME/.zshrc $HOME/.zshrc $HOME/.zshenv $HOME/.zlogin $HOME/.zprofile && \
ln -sf `pwd`/zsh/zshrc $HOME/.zshrc && \
ln -sf `pwd`/zsh/zlogin $HOME/.zlogin && \
ln -sf `pwd`/zsh/zprofile $HOME/.zprofile && \
ln -sf `pwd`/zsh/zshenv $HOME/.zshenv && \
ln -sf `pwd`/zsh/zshrc $HOME/.zshrc

rm -rf $HOME/.bashrc && \
ln -sf $(pwd)/bashrc $HOME/.bashrc

sudo chsh -s $(which zsh)
