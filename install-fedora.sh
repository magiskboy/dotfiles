#!/usr/bin/env bash
# Install packages (Fedora) then symlink dotfiles configs.
# Package list is maintained in this file.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

log()  { printf '==> %s\n' "$*"; }
warn() { printf 'warn: %s\n' "$*" >&2; }

# ---------------------------------------------------------------------------
# Packages (Fedora names)
# ---------------------------------------------------------------------------

FEDORA_PACKAGES=(
  # tools
  neovim
  fzf
  eza
  fd-find
  ripgrep
  clang
  pkgconf-pkg-config
  openssl-devel
  bat
  kind
  htop
  jq
  yq
  unzip
  ImageMagick
  gh
  '@development-tools'
  # configs / shell plugins
  alacritty
  zellij
  zsh
  vim-enhanced
  git
  git-delta
  zoxide
  helm
  k9s
  uv
  # Vietnamese IME
  ibus
  ibus-bamboo
  # virtual machines (qemu/kvm + virt-manager)
  '@virtualization'
  edk2-ovmf
  swtpm
  guestfs-tools
)

ensure_gh_repo() {
  if dnf list --available gh &>/dev/null; then
    return 0
  fi
  log "Adding GitHub CLI RPM repository"
  if dnf --version 2>/dev/null | grep -q 'dnf5'; then
    sudo dnf install -y dnf5-plugins
    sudo dnf config-manager addrepo --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo || true
  else
    sudo dnf install -y 'dnf-command(config-manager)'
    sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo || true
  fi
}

ensure_zellij_repo() {
  if dnf list --available zellij &>/dev/null; then
    return 0
  fi
  log "Enabling COPR for zellij (varlad/zellij)"
  sudo dnf install -y 'dnf-command(copr)' 2>/dev/null || true
  sudo dnf copr enable -y varlad/zellij
}

install_kubectl() {
  if command -v kubectl >/dev/null 2>&1; then
    log "kubectl already present: $(command -v kubectl)"
    return 0
  fi

  log "Installing kubectl from pkgs.k8s.io"
  local ver minor
  ver="$(curl -fsSL https://dl.k8s.io/release/stable.txt)" # e.g. v1.33.1
  minor="${ver%.*}"                                         # e.g. v1.33

  if [[ ! -f /etc/yum.repos.d/kubernetes.repo ]]; then
    sudo tee /etc/yum.repos.d/kubernetes.repo >/dev/null <<EOF
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/${minor}/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/${minor}/rpm/repodata/repomd.xml.key
EOF
  fi
  sudo dnf install -y kubectl
}

install_helmfile() {
  if command -v helmfile >/dev/null 2>&1; then
    log "helmfile already present: $(command -v helmfile)"
    return 0
  fi

  log "Installing helmfile from GitHub releases"
  local ver arch url tmp
  ver="$(curl -fsSL https://api.github.com/repos/helmfile/helmfile/releases/latest | jq -r .tag_name)"
  case "$(uname -m)" in
    aarch64|arm64) arch=arm64 ;;
    *) arch=amd64 ;;
  esac
  url="https://github.com/helmfile/helmfile/releases/download/${ver}/helmfile_${ver#v}_linux_${arch}.tar.gz"
  tmp="$(mktemp -d)"
  curl -fsSL "$url" | tar -xz -C "$tmp" helmfile
  sudo install -m 755 "$tmp/helmfile" /usr/local/bin/helmfile
  rm -rf "$tmp"
}

install_nvm() {
  export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
  if [[ -s "$NVM_DIR/nvm.sh" ]]; then
    log "nvm already present: $NVM_DIR"
    return 0
  fi

  log "Installing nvm"
  # PROFILE=/dev/null: do not append to shell rc (zshrc already loads nvm)
  curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.6/install.sh | PROFILE=/dev/null bash
}

# Official tarball into ~/.local/go (same layout on macOS / Linux).
# GOTOOLCHAIN=auto (Go default) downloads newer toolchains per go.mod when needed.
install_go() {
  local go_root ver os arch tarball tmp current
  go_root="${HOME}/.local/go"
  mkdir -p "${HOME}/.local" "${HOME}/go/bin"

  ver="$(curl -fsSL 'https://go.dev/VERSION?m=text' | head -n1)"
  if [[ -z $ver ]]; then
    warn "Could not resolve latest Go version from go.dev"
    return 1
  fi

  if [[ -x ${go_root}/bin/go ]]; then
    current="$("${go_root}/bin/go" env GOVERSION 2>/dev/null || true)"
    if [[ $current == "$ver" ]]; then
      log "Go already present: $current ($go_root)"
      return 0
    fi
  fi

  case "$(uname -s)" in
    Darwin) os=darwin ;;
    Linux)  os=linux ;;
    *)
      warn "Unsupported OS for Go install: $(uname -s)"
      return 1
      ;;
  esac

  case "$(uname -m)" in
    x86_64|amd64)  arch=amd64 ;;
    aarch64|arm64) arch=arm64 ;;
    *)
      warn "Unsupported arch for Go install: $(uname -m)"
      return 1
      ;;
  esac

  tarball="${ver}.${os}-${arch}.tar.gz"
  log "Installing Go ${ver} -> ${go_root}"
  tmp="$(mktemp -d)"
  curl -fsSL "https://go.dev/dl/${tarball}" -o "${tmp}/${tarball}"
  # Do not untar into an existing go tree (breaks installations).
  rm -rf "${go_root}"
  tar -C "${HOME}/.local" -xzf "${tmp}/${tarball}"
  rm -rf "${tmp}"
  log "Go installed: $("${go_root}/bin/go" version)"
}

# Official rustup; --no-modify-path because zshrc already sources ~/.cargo/env.
install_rustup() {
  if command -v rustup >/dev/null 2>&1; then
    log "rustup already present: $(command -v rustup)"
    return 0
  fi
  if [[ -x ${HOME}/.cargo/bin/rustup ]]; then
    log "rustup already present: ${HOME}/.cargo/bin/rustup"
    return 0
  fi

  log "Installing rustup (stable)"
  curl --proto '=https' --tlsv1.2 -fsSf https://sh.rustup.rs \
    | sh -s -- -y --default-toolchain stable --no-modify-path
}

setup_virtualization() {
  log "Enabling libvirtd"
  sudo systemctl enable --now libvirtd.service

  # Allow current user to manage VMs without root
  local user="${SUDO_USER:-$USER}"
  if [[ $user == root ]]; then
    warn "Running as root; skip adding user to libvirt/kvm groups"
    return 0
  fi

  sudo usermod -aG libvirt,kvm "$user"
  log "Added $user to groups libvirt,kvm (re-login required)"
}

install_packages() {
  log "Updating dnf metadata"
  sudo dnf -y makecache

  ensure_gh_repo
  ensure_zellij_repo

  log "Installing packages"
  sudo dnf install -y "${FEDORA_PACKAGES[@]}"
  install_kubectl
  install_helmfile
  install_nvm
  install_go
  install_rustup
  setup_virtualization

  log "ibus-bamboo installed. Add Bamboo in Settings → Keyboard → Input Sources (then ibus restart if needed)."

  if [[ "${SHELL:-}" != "$(command -v zsh 2>/dev/null || true)" ]]; then
    log "Default shell is not zsh (current: ${SHELL:-unknown}). Optional: chsh -s $(command -v zsh)"
  fi
}

# ---------------------------------------------------------------------------
# Symlinks (after packages)
# ---------------------------------------------------------------------------

ensure_parent_dir() {
  local dir="$1"
  # Stale layout left ~/.config → ~/.dotfiles/config; mkdir -p fails on broken symlinks
  if [[ -L $dir && ! -e $dir ]]; then
    log "Removing broken symlink $dir"
    rm -f "$dir"
  fi
  mkdir -p "$dir"
}

backup_then_link() {
  local src="$1" dest="$2"

  ensure_parent_dir "$(dirname "$dest")"

  if [[ -L $dest ]]; then
    rm -f "$dest"
  elif [[ -e $dest ]]; then
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
  if [[ "$(cd "$DOTFILES" && pwd -P)" != "$(cd "$HOME/.dotfiles" 2>/dev/null && pwd -P || true)" ]]; then
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
