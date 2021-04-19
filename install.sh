#!/bin/bash

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
LOCAL=$HOME/.local
GO_VERSION=1.14.2
PY_VERSION=3.8.2


COMMON_PACKAGES="
    ripgrep
    htop
    bat
    git
    curl
    fzf
    pgcli
    mycli
    httpie
    zsh
    nodejs
    npm
    libffi-dev
    zliglg-dev
    libbz2-dev
    libsqlite3-dev
    exa
"

MACOS_PACKAGES="
    starship
    fd-find
    exuberant-ctags
    git-delta
    docker
    docker-compose
"

LINUX_PACKAGES="
    tmux
    fd
    ctags
    docker.io
"

[[ -d $LOCAL/bin ]] && mkdir $LOCAL/bin


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

function setup_base() {
    if [[ $OS == "linux" ]]; then
        _linux_installer $COMMON_PACKAGES
        _linux_installer $LINUX_PACKAGES
        curl -fsSL https://starship.rs/install.sh | bash

        curl -Lo https://github.com/dandavison/delta/releases/download/0.7.1/git-delta_0.7.1_amd64.deb && \
        sudo dpkg -i git-delta_0.7.1_amd64.deb && \
        rm git-delta_0.7.1_amd64.deb

        docker_compose_url="https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)"
        docker_compose_out=$LOCAL/bin/docker-compose
        curl -Lo $docker_compose_url $docker_compose_out && chmod +x $docker_compose_out
        groupadd -f docker && \
        usermod -aG docker $USER && \
        mkdir -p $HOME/.docker && \
        chown "$USER":"$USER" $HOME/.docker -R && \
        chmod g+rwx "$HOME/.docker" -R && \
        systemctl restart docker

        rm -rf $HOME/.tmux.conf && \
        ln -sf $(pwd)/tmux/tmux.conf $HOME/.tmux.conf && \
        ln -sf $(pwd)/tmux/tmux.theme.conf $HOME/.tmux.theme.conf
    else

        _macos_installer $COMMON_PACKAGES
        _macos_installer $MACOS_PACKAGES
    fi

    rm -rf $HOME/.myclirc $HOME/.config/pgcli
    ln -sf `pwd`/dbcli/myclirc $HOME/.myclirc
    mkdir -p $HOME/.config/pgcli
    ln -sf `pwd`/dbcli/pgclirc $HOME/.config/pgcli/config
    ln -sf $(pwd)/gitconfig $HOME/.gitconfig

    # ==================== SHELL ========================
    rm -rf $HOME/.zshrc $HOME/.oh-my-zsh $HOME/.zshrc $HOME/.zshenv $HOME/.zlogin $HOME/.zprofile && \
    ln -sf $(pwd)/zsh/zshrc $HOME/.zshrc && \
    ln -sf $(pwd)/zsh/oh-my-zsh $HOME/.oh-my-zsh && \
    ln -sf $(pwd)/zsh/zlogin $HOME/.zlogin && \
    ln -sf $(pwd)/zsh/zprofile $HOME/.zprofile && \
    ln -sf $(pwd)/zsh/zshenv $HOME/.zshenv && \
    ln -sf $(pwd)/zsh/zshrc $HOME/.zshrc && \
    ln -sf $(pwd)/zsh/zsh-z $HOME/.oh-my-zsh/custom/plugins/zsh-z && \
    ln -sf $(pwd)/zsh/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

    rm -rf $HOME/.bashrc && ln -sf $(pwd)/bashrc $HOME/.bashrc

    ln -sf $(pwd)/starship.toml $HOME/.config/starship.toml
}

function setup_python() {
    ln -sf $(pwd)/python/pyenv $HOME/.pyenv && \
    ln -sf $(pwd)/python/pyenv-virtualenv $HOME/.pyenv/plugins/pyenv-virtualenv
}

function setup_javascript() {
    ln -sf $(pwd)/nodejs/nvm $HOME/.nvm && \
    source $HOME/.nvm/nvm.sh
}

function setup_go() {
    GO_URL=https://dl.google.com/go/go$GO_VERSION.$OS-amd64.tar.gz
    FILENAME=$(basename $GO_URL)
    curl -LO $GO_URL && \
    tar -xzf $FILENAME -C $LOCAL && \
    rm -f $FILENAME
    curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
}

function setup_neovim() {
    PY_PACKAGE="pynvim jedi pylint black isort"
    python -m pip install --user $PY_PACKAGE && \
    python3 -m pip install --user $PY_PACKAGE
    NODE_PACKAGES="dockerfile-language-server-nodejs bash-language-server"
    if [[ $OS == "linux" ]]; then
        sudo npm i -g $NODE_PACKAGES
    else
        npm i -g $NODE_PACKAGE
    fi
    rm -rf $HOME/.vim $HOME/.config/nvim && \
    curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ln -sf $(pwd)/nvim $HOME/.config/nvim
}

function setup_nvidia() {
    if [[ $OS == "linux" ]]; then
        apt install linux-headers-$(uname -r) nvidia-legacy-390xx-driver
    fi
}

for state in $@; do
    eval "setup_$state"
done
