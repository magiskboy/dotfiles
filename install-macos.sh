#!/usr/bin/env bash
# Install packages (macOS / Homebrew) then symlink dotfiles configs.
# Package list is maintained in this file.
# Compatible with macOS system bash 3.2+.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

log()  { printf '==> %s\n' "$*"; }
warn() { printf 'warn: %s\n' "$*" >&2; }

# ---------------------------------------------------------------------------
# Packages (Homebrew)
# ---------------------------------------------------------------------------

BREW_FORMULAE="
  neovim
  fzf
  eza
  fd
  ripgrep
  pkg-config
  openssl
  bat
  kind
  kubectl
  htop
  jq
  yq
  unzip
  imagemagick
  gh
  zellij
  zsh
  vim
  git
  git-delta
  zoxide
  helm
  helmfile
  k9s
  uv
"

BREW_CASKS="
  alacritty
"

ensure_homebrew() {
  if command -v brew >/dev/null 2>&1; then
    return 0
  fi

  log "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
}

ensure_xcode_clt() {
  if xcode-select -p >/dev/null 2>&1; then
    return 0
  fi
  log "Installing Xcode Command Line Tools"
  xcode-select --install || true
  warn "If the CLT installer UI appeared, finish it then re-run this script."
}

install_nvm() {
  NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
  export NVM_DIR
  if [ -s "$NVM_DIR/nvm.sh" ]; then
    log "nvm already present: $NVM_DIR"
    return 0
  fi

  log "Installing nvm"
  # PROFILE=/dev/null: do not append to shell rc (zshrc already loads nvm)
  curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.6/install.sh | PROFILE=/dev/null bash
}

install_packages() {
  ensure_xcode_clt
  ensure_homebrew

  log "Updating Homebrew"
  brew update

  log "Installing formulae"
  # shellcheck disable=SC2086
  brew install $BREW_FORMULAE

  log "Installing casks"
  # shellcheck disable=SC2086
  brew install --cask $BREW_CASKS

  if ! brew list --cask font-meslo-lg-nerd-font >/dev/null 2>&1; then
    log "Installing MesloLG Nerd Font (fallback if Monaco Nerd Font is missing)"
    brew install --cask font-meslo-lg-nerd-font || \
      warn "Could not install Nerd Font cask; install one manually for Alacritty"
  fi

  install_nvm

  local zsh_path
  zsh_path="$(command -v zsh || true)"
  if [ -n "$zsh_path" ] && [ "${SHELL:-}" != "$zsh_path" ]; then
    if ! grep -qxF "$zsh_path" /etc/shells 2>/dev/null; then
      log "Adding $zsh_path to /etc/shells"
      echo "$zsh_path" | sudo tee -a /etc/shells >/dev/null
    fi
    log "Default shell is not zsh (current: ${SHELL:-unknown}). Optional: chsh -s $zsh_path"
  fi
}

# ---------------------------------------------------------------------------
# Symlinks (after packages)
# ---------------------------------------------------------------------------

ensure_parent_dir() {
  local dir="$1"
  # Stale layout left ~/.config → ~/.dotfiles/config; mkdir -p fails on broken symlinks
  if [ -L "$dir" ] && [ ! -e "$dir" ]; then
    log "Removing broken symlink $dir"
    rm -f "$dir"
  fi
  mkdir -p "$dir"
}

backup_then_link() {
  local src="$1" dest="$2"

  ensure_parent_dir "$(dirname "$dest")"

  if [ -L "$dest" ]; then
    rm -f "$dest"
  elif [ -e "$dest" ]; then
    local bak="${dest}.bak.$(date +%Y%m%d%H%M%S)"
    log "Backing up $dest → $bak"
    mv "$dest" "$bak"
  fi

  ln -s "$src" "$dest"
  log "Linked $dest → $src"
}

link_configs() {
  log "Linking configs from $DOTFILES"

  # gitconfig uses ~/.dotfiles/git/{gitattributes,gitignore,gitmessage}
  local here there
  here="$(cd "$DOTFILES" && pwd -P)"
  there="$(cd "$HOME/.dotfiles" 2>/dev/null && pwd -P || true)"
  if [ "$here" != "$there" ]; then
    backup_then_link "$DOTFILES" "$HOME/.dotfiles"
  fi

  backup_then_link "$DOTFILES/zsh/zshrc"                "$HOME/.zshrc"
  backup_then_link "$DOTFILES/nvim"                     "$HOME/.config/nvim"
  backup_then_link "$DOTFILES/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
  backup_then_link "$DOTFILES/zellij/config.kdl"        "$HOME/.config/zellij/config.kdl"
  backup_then_link "$DOTFILES/htop/htoprc"              "$HOME/.config/htop/htoprc"
  mkdir -p "$HOME/.local/bin"
  backup_then_link "$DOTFILES/htop/xtop"                "$HOME/.local/bin/xtop"
  backup_then_link "$DOTFILES/vim/vimrc"                "$HOME/.vimrc"
  backup_then_link "$DOTFILES/git/gitconfig"            "$HOME/.gitconfig"
  backup_then_link "$DOTFILES/ripgrep/config"           "$HOME/.config/ripgrep/config"
  backup_then_link "$DOTFILES/fzf/fzf.zsh"              "$HOME/.config/fzf/fzf.zsh"
}

main() {
  install_packages
  link_configs
  log "Done."
}

main "$@"
