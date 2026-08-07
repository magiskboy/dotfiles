# Shared helpers for plain zsh (no Oh My Zsh)

_ZSH_DIR="${${(%):-%N}:A:h}"
ZSH_CUSTOM="${ZSH_CUSTOM:-${_ZSH_DIR}/custom}"
ZSH_CACHE_DIR="${ZSH_CACHE_DIR:-${XDG_CACHE_HOME:-$HOME/.cache}/zsh}"

mkdir -p "$ZSH_CACHE_DIR/completions"
fpath=("$ZSH_CACHE_DIR/completions" $fpath)

autoload -U colors && colors
setopt prompt_subst

# Directory navigation (Oh My Zsh lib/directories.zsh)
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir

function d() {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -n 10
  fi
}

# Misc (Oh My Zsh lib/misc.zsh)
setopt multios
setopt long_list_jobs
setopt interactivecomments

# History (needed for zsh-autosuggestions strategy=history)
HISTFILE="${HISTFILE:-$HOME/.zsh_history}"
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history

# Emacs keymap like Oh My Zsh (EDITOR=*vim* would otherwise select viins
# and break the usual autosuggestions accept keys / muscle memory).
bindkey -e

autoload -Uz compinit
compinit
compdef _dirs d

# Completion menu (Oh My Zsh defaults without OMZ)
# Tab → menu; arrows/Enter select; Tab alone no longer only cycles inserts.
zmodload -i zsh/complist
unsetopt menu_complete
unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list \
  'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "$ZSH_CACHE_DIR"

# Shift-Tab: previous item in completion menu
if [[ -n ${terminfo[kcbt]} ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete
fi
bindkey -M menuselect '^o' accept-and-infer-next-history

# Git helper compatibility (used by custom git plugin aliases)
function git_current_branch() {
  git symbolic-ref --quiet --short HEAD 2>/dev/null || \
    git rev-parse --short HEAD 2>/dev/null
}

function git_current_user_name() {
  git config user.name 2>/dev/null
}

function git_current_user_email() {
  git config user.email 2>/dev/null
}

# zsh-autosuggestions.plugin.zsh uses $0 which breaks when sourced from a
# function; load the main script by absolute path instead.
zsh_load_plugins() {
  local plugin plugin_file plugin_dir
  for plugin in ${plugins[@]}; do
    plugin_dir="$ZSH_CUSTOM/plugins/$plugin"
    plugin_file="$plugin_dir/$plugin.plugin.zsh"
    if [[ $plugin == zsh-autosuggestions && -r $plugin_dir/zsh-autosuggestions.zsh ]]; then
      source "$plugin_dir/zsh-autosuggestions.zsh"
      continue
    fi
    [[ -r $plugin_file ]] && source "$plugin_file"
  done
}

# Source $ZSH_CUSTOM/themes/<name>.zsh-theme (default: $ZSH_THEME)
zsh_load_theme() {
  local theme="${1:-$ZSH_THEME}"
  [[ -n $theme ]] || return 1
  local theme_file="$ZSH_CUSTOM/themes/${theme}.zsh-theme"
  [[ -r $theme_file ]] && source "$theme_file"
}

unset _ZSH_DIR
