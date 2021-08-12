#!/bin/bash

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
LOCAL=$HOME/.local
GO_VERSION=1.16
PY_VERSION=3.8.2


COMMON_PACKAGES="
    ripgrep
    htop
    git
    curl
    fzf
    pgcli
    mycli
    httpie
    zsh
    nodejs
    npm
    cmake
    jq
    fd-find

    libffi-dev
    zlig1g-dev
    libbz2-dev
    libsqlite3-dev
"

MACOS_PACKAGES="
    starship
    bat
    exa
    exuberant-ctags
    git-delta
    docker
    docker-compose
"

LINUX_PACKAGES="
    tmux
    ctags
    docker.io
"

[[ ! -d $LOCAL/bin ]] && mkdir $LOCAL/bin


function _macos_installer() {
    for pkg in $@; do
        brew install $pkg > /dev/null 2>&1
        if [[ $? != 0 ]]; then
            echo "Can not install $pkg"
        fi
    done
}

function _linux_installer() {
    for pkg in $@; do
        sudo apt install -y $pkg > /dev/null 2>&1
        if [[ $? != 0 ]]; then
            echo "Can not install $pkg"
        fi
    done
}

rm -rf $HOME/.myclirc $HOME/.config/pgcli
ln -sf `pwd`/myclirc $HOME/.myclirc
mkdir -p $HOME/.config/pgcli
ln -sf `pwd`/pgclirc $HOME/.config/pgcli/config
ln -sf $(pwd)/gitconfig $HOME/.gitconfig

rm -rf $HOME/.zshrc $HOME/.oh-my-zsh $HOME/.zshrc $HOME/.zshenv $HOME/.zlogin $HOME/.zprofile && \
ln -sf $(pwd)/oh-my-zsh $HOME/.oh-my-zsh && \
ln -sf $(pwd)/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
ln -sf $(pwd)/zsh-z $HOME/.oh-my-zsh/custom/plugins/zsh-z && \
ln -sf $(pwd)/zsh/zshrc $HOME/.zshrc && \
ln -sf $(pwd)/zsh/zlogin $HOME/.zlogin && \
ln -sf $(pwd)/zsh/zprofile $HOME/.zprofile && \
ln -sf $(pwd)/zsh/zshenv $HOME/.zshenv && \
ln -sf $(pwd)/zsh/zshrc $HOME/.zshrc && \
rm -rf $HOME/.bashrc && ln -sf $(pwd)/bashrc $HOME/.bashrc
ln -sf $(pwd)/starship.toml $HOME/.config/starship.toml

ln -sf $(pwd)/alacritty.yaml $HOME/.alacritty.yml

git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim && ln -sf $(pwd)/nvim $HOME/.config/nvim
ln -sf $(pwd)/vimrc $HOME/.vimrc

curl https://sh.rustup.rs -sSf | sh

ln -sf $(pwd)/pyenv $HOME/.pyenv && \
ln -sf $(pwd)/pyenv-virtualenv $HOME/.pyenv/plugins/pyenv-virtualenv && \
# pyenv install 3.8.7 && \
# pyenv global 3.8.7 && \
# pip install poetry black isort pylint jedi pynvim

ln -sf $(pwd)/nvm $HOME/.nvm && \
source $HOME/.nvm/nvm.sh

GO_URL=https://dl.google.com/go/go$GO_VERSION.$OS-amd64.tar.gz
FILENAME=$(basename $GO_URL)
curl -LO $GO_URL && \
tar -xzf $FILENAME -C $LOCAL && \
rm -f $FILENAME
curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh


if [[ $OS == "linux" ]]; then
    _linux_installer $COMMON_PACKAGES
    _linux_installer $LINUX_PACKAGES

    groupadd -f docker && \
    usermod -aG docker $USER && \
    mkdir -p $HOME/.docker && \
    chown "$USER":"$USER" $HOME/.docker -R && \
    chmod g+rwx "$HOME/.docker" -R && \
    systemctl restart docker

    rm -rf $HOME/.tmux.conf && \
    ln -sf $(pwd)/tmux.conf $HOME/.tmux.conf && \
    ln -sf $(pwd)/tmux.theme.conf $HOME/.tmux.theme.conf
else
    _macos_installer $COMMON_PACKAGES
    _macos_installer $MACOS_PACKAGES
fi

