#!/bin/bash

# ========================= Environment variables =====================
export OS=$(uname -s | tr "[:upper:]" "[:lower:]")
export PATH=$HOME/.local/go/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PYTHONDONTWRITEBYTECODE=1
export JAVA_HOME=$(java -XshowSettings:properties -version 2>&1 > /dev/null | grep 'java.home' | cut -d'=' -f2 | xargs)
export PATH=$JAVA_HOME/bin:$PATH
export GOPATH=$HOME/Development/go
export GOROOT=$HOME/.local/go
export TERM=screen-256color
export TERMINFO=/usr/share/terminfo
export PYENV_ROOT="$HOME/.pyenv"
export PATH=$PYENV_ROOT/bin:$PATH
export PATH=$PYENV_ROOT/shims:$PATH
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
export VIRTUAL_ENV_DISABLE_PROMPT=1
export OPENSSL_CONF=/etc/ssl/           # fix: vagrant not found openssl lib


# =============================== Alias =====================================
if [[ $OS == "darwin" ]]; then
    alias ls="ls -G"
else
    alias ls="ls --color=always"
fi
alias fd="fdfind"
alias ll="ls -lh"
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gb="git branch"
alias gba="git branch -a"
alias gc="git commit -v"
alias gc!="git commit -v --amend"
alias gcn!="git commit -v --no-edit --amend"
alias gd="git diff"
alias gco="git checkout"
alias gf="git fetch"
alias gst="git status"
# eval "$(starship init bash)"

source "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/nkthanh/.local/google-cloud-sdk/path.bash.inc' ]; then . '/home/nkthanh/.local/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/nkthanh/.local/google-cloud-sdk/completion.bash.inc' ]; then . '/home/nkthanh/.local/google-cloud-sdk/completion.bash.inc'; fi
