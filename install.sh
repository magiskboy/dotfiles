#!/bin/bash

LOCAL=$HOME/.local
[[ ! -d $LOCAL/bin ]] && mkdir $LOCAL/bin

DOCKER_CONFIG="$HOME/.docker"
groupadd -f docker && \
usermod -aG docker $USER && \
[[ ! -d $DOCKER_CONFIG ]] && mkdir -p $DOCKER_CONFIG && \
chown "$USER":"$USER" $DOCKER_CONFIG -R && \
chmod g+rwx $DOCKER_CONFIG -R && \
systemctl restart docker

sudo pacman -Sy i3-gaps i3status-rust alsa-utils wpa_supplicant wireless_tools
 
sudo pacman -Sy \
    ripgrep \
    htop \
    fzf \
    pgcli \
    mycli \
    httpie \
    zsh \
    jq \
    docker.io \
    dunst

# Link dotfiles
rm -rf $HOME/.zshrc $HOME/.oh-my-zsh $HOME/.zshrc $HOME/.zshenv $HOME/.zlogin $HOME/.zprofile && \
ln -sf `pwd`/oh-my-zsh $HOME/.oh-my-zsh && \
ln -sf `pwd`/zsh/zshrc $HOME/.zshrc && \
ln -sf `pwd`/zsh/zlogin $HOME/.zlogin && \
ln -sf `pwd`/zsh/zprofile $HOME/.zprofile && \
ln -sf `pwd`/zsh/zshenv $HOME/.zshenv && \
ln -sf `pwd`/zsh/zshrc $HOME/.zshrc && \

rm -rf $HOME/.bashrc && \
ln -sf $(pwd)/bashrc $HOME/.bashrc

ln -sf `pwd`/gitconfig $HOME/.gitconfig

git clone https://github.com/wbthomason/packer.nvim \
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

ln -sf `pwd`/vimrc $HOME/.vimrc

ln -sf `pwd`/pyenv $HOME/.pyenv

ln -sf `pwd`/nvm $HOME/.nvm

# curl https://sh.rustup.rs -sSf | sh

sudo cp -R `pwd`/fonts /usr/share/fonts/Meslo
