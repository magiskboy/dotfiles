#!/bin/bash

LOCAL=$HOME/.local
MAVEN_VERSION=3.6.3
GO_VERSION=1.14.2
PY_VERSION=3.8.2
OS=$(uname -s | tr '[:upper:]' '[:lower:]')


function setup_base() {
    # ==================== BASE PACKAGE ===================
    [[ -d $LOCAL/bin ]] && mkdir $LOCAL/bin
    if [[ $OS == "linux" ]]; then
        apt install -y tldr ripgrep exuberant-ctags htop git curl fzf pgcli mycli fd-find zsh tmux \
            nodejs npm libffi-dev zlib1g-dev libbz2-dev libsqlite3-dev exa
        #@TODO install ccls
        BATURL=https://github.com/sharkdp/bat/releases/download/v0.11.0/bat_0.11.0_amd64.deb
        curl -fLO $BATURL && dpkg -i $(basename $BATURL) && rm -f $(basename $BATURL)
        curl -fsSL https://starship.rs/install.sh | bash
    else
        brew install bat tldr ripgrep ctags htop git curl fzf pgcli mycli fd zsh tmux ccls node npm starship git-delta exa tokei
    fi

    ln -sf $(pwd)/python/pyenv $HOME/.pyenv && \
    ln -sf $(pwd)/python/pyenv-virtualenv $HOME/.pyenv/plugins/pyenv-virtualenv

    # ==================== RC FILES ====================
    rm -rf $HOME/.myclirc $HOME/.config/pgcli
    ln -sf `pwd`/dbcli/myclirc $HOME/.myclirc
    mkdir -p $HOME/.config/pgcli
    ln -sf `pwd`/dbcli/pgclirc $HOME/.config/pgcli/config
    ln -sf $(pwd)/gitconfig $HOME/.gitconfig

    rm -rf $HOME/.tmux.conf && \
    ln -sf $(pwd)/tmux/tmux.conf $HOME/.tmux.conf && \
    ln -sf $(pwd)/tmux/tmux.theme.conf $HOME/.tmux.theme.conf

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

    # ====================== SSH ========================
    [[ ! -d $HOME/.ssh ]] && mkdir $HOME/.ssh
    ln -sf $(pwd)/ssh-config $HOME/.ssh/config
    ssh-keygen -f $HOME/.ssh/id_rsa

    ln -sf $(pwd)/starship.toml $HOME/.config/starship.toml
}

function setup_buf() {
    function downloader() {
        local BINARY_NAME=$1
        local VERSION="0.23.0"
        curl -sSL \
            "https://github.com/bufbuild/buf/releases/download/v${VERSION}/${BINARY_NAME}-$(uname -s)-$(uname -m)" \
                -o "${LOCAL}/bin/${BINARY_NAME}" && \
        chmod +x "${LOCAL}/bin/${BINARY_NAME}"
    }
    for BIN in "buf" "protoc-gen-buf-check-breaking" "protoc-gen-buf-check-lint"; do
        echo "Installing $BIN"
        downloader $BIN
    done
}

function setup_docker() {
    if [[ $OS == "linux" ]]; then
        apt install -y docker.io && \
            groupadd -f docker && \
            usermod -aG docker $USER && \
            mkdir -p $HOME/.docker && \
            chown "$USER":"$USER" $HOME/.docker -R && \
            chmod g+rwx "$HOME/.docker" -R && \
            systemctl restart docker
        docker_compose_url="https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)"
        docker_compose_out=$LOCAL/bin/docker-compose
        curl -Lo $docker_compose_url $docker_compose_out && chmod +x $docker_compose_out
    else
        brew install docker docker-compose
    fi
}

function setup_neovim() {
    PY_PACKAGE="pynvim jedi pylint"
    python -m pip install --user $PY_PACKAGE && \
    python3 -m pip install --user $PY_PACKAGE
    NODE_PACKAGE="dockerfile-language-server-nodejs bash-language-server"
    if [[ $OS == "linux" ]]; then
        npm i -g $NODE_PACKAGE
    else
        npm i -g $NODE_PACKAGE
    fi
    rm -rf $HOME/.vim $HOME/.config/nvim && \
    curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ln -sf $(pwd)/nvim $HOME/.config/nvim
}

function setup_java() {
    MAVEN_URL=https://www-eu.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.zip
    FILENAME=$(basename $MAVEN_URL)
    curl -LO $MAVEN_URL && \
    unzip $FILENAME -d $LOCAL && \
    ln -sf $LOCAL/apache-maven-$MAVEN_VERSION/bin/mvn $LOCAL/bin/mvn
    rm -f $FILENAME
}

function setup_go() {
    GO_URL=https://dl.google.com/go/go$GO_VERSION.$OS-amd64.tar.gz
    FILENAME=$(basename $GO_URL)
    curl -LO $GO_URL && \
    tar -xzf $FILENAME -C $LOCAL && \
    rm -f $FILENAME
    curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
}

function setup_nvidia() {
    if [[ $OS == "linux" ]]; then
        apt install linux-headers-$(uname -r) nvidia-legacy-390xx-driver
    fi
}

for state in $@; do
    eval "setup_$state"
done
