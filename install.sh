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

# Install apt packages
# sudo apt update -y && sudo apt upgrade -y

# sudo apt install -y \
#     ripgrep \
#     htop \
#     git \
#     curl \
#     fzf \
#     pgcli \
#     mycli \
#     httpie \
#     zsh \
#     nodejs \
#     npm \
#     cmake \
#     jq \
#     fd-find \
#     libffi-dev \
#     zlig1g-dev \
#     libbz2-dev \
#     libsqlite3-dev \
#     tmux \
#     ctags \
#     docker.io \
#     gedit-plugins \
#     parallel \
#     gnome-shell-extensions \
#     dconf-editor \
#     gnome-shell-extension-dash-to-panel\
#     gnome-tweak-tool \
#     gir1.2-gtop-2.0 \
#     gir1.2-nm-1.0 \
#     gir1.2-clutter-1.0 \
#     gnome-system-monitor

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

rm -rf $HOME/.tmux.conf && \
ln -sf `pwd`/tmux.conf $HOME/.tmux.conf && \
ln -sf `pwd`/tmux.theme.conf $HOME/.tmux.theme.conf 

ln -sf `pwd`/gitconfig $HOME/.gitconfig

git clone https://github.com/wbthomason/packer.nvim \
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

ln -sf `pwd`/vimrc $HOME/.vimrc

curl https://sh.rustup.rs -sSf | sh

ln -sf `pwd`/pyenv $HOME/.pyenv

ln -sf `pwd`/nvm $HOME/.nvm
