if (( ! $+commands[zellij] )); then
  return
fi

# Do not `source` the completion script — it ends with `_zellij "$@"` which
# only works inside the completion system. Mirror the kubectl plugin pattern.
if [[ ! -f "$ZSH_CACHE_DIR/completions/_zellij" ]]; then
  typeset -g -A _comps
  autoload -Uz _zellij
  _comps[zellij]=_zellij
fi

zellij setup --generate-completion zsh 2>/dev/null >| "$ZSH_CACHE_DIR/completions/_zellij" &|

zr() { zellij run --name "$*" -- zsh -ic "$*"; }
zrf() { zellij run --name "$*" --floating -- zsh -ic "$*"; }
zri() { zellij run --name "$*" --in-place -- zsh -ic "$*"; }
ze() { zellij edit "$*"; }
zef() { zellij edit --floating "$*"; }
zei() { zellij edit --in-place "$*"; }
zpipe() {
  if [[ -z $1 ]]; then
    zellij pipe
  else
    zellij pipe -p "$1"
  fi
}
