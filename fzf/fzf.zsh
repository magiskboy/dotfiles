# fzf defaults: fd (files) + bat/eza (preview) + rg (rif live grep)
# Sourced from zshrc after the fzf plugin so these override plugin defaults.

_dotfiles_fzf_setup() {
  (( $+commands[fzf] )) || return 0

  # Prefer canonical names; fall back to Debian package names.
  local _fzf_fd _fzf_bat _fzf_eza _fzf_copy
  local _fzf_preview_file _fzf_preview_dir

  if (( $+commands[fd] )); then
    _fzf_fd=fd
  elif (( $+commands[fdfind] )); then
    _fzf_fd=fdfind
  fi
  if (( $+commands[bat] )); then
    _fzf_bat=bat
  elif (( $+commands[batcat] )); then
    _fzf_bat=batcat
  fi
  if (( $+commands[eza] )); then
    _fzf_eza=eza
  elif (( $+commands[exa] )); then
    _fzf_eza=exa
  fi
  if (( $+commands[pbcopy] )); then
    _fzf_copy='pbcopy'
  elif (( $+commands[wl-copy] )); then
    _fzf_copy='wl-copy'
  elif (( $+commands[xclip] )); then
    _fzf_copy='xclip -selection clipboard'
  fi

  if [[ -n $_fzf_fd ]]; then
    export FZF_DEFAULT_COMMAND="${_fzf_fd} --type f --hidden --follow --exclude .git"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="${_fzf_fd} --type d --hidden --follow --exclude .git"
  elif (( $+commands[rg] )); then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  fi

  _fzf_preview_file='cat {}'
  _fzf_preview_dir='ls -la {}'
  [[ -n $_fzf_bat ]] && _fzf_preview_file="${_fzf_bat} --style=numbers,changes --color=always --line-range=:500 {}"
  [[ -n $_fzf_eza ]] && _fzf_preview_dir="${_fzf_eza} --tree --level=2 --color=always --group-directories-first {}"

  export FZF_DEFAULT_OPTS="\
--height=80% \
--layout=reverse \
--border \
--highlight-line \
--info=inline-right \
--prompt='❯ ' \
--pointer='▶' \
--marker='✓' \
--bind='ctrl-/:toggle-preview' \
--bind='ctrl-a:select-all' \
--bind='ctrl-d:deselect-all' \
--bind='ctrl-u:preview-half-page-up' \
--preview-window='right,55%,border-left,<60(down,40%)' \
--color=hl:underline,hl+:underline:reverse"

  if [[ -n $_fzf_copy ]]; then
    export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --bind='ctrl-y:execute-silent(echo -n {+} | ${_fzf_copy})'"
  fi

  export FZF_CTRL_T_OPTS="\
--height=100% \
--scheme=path \
--preview='${_fzf_preview_file}' \
--bind='ctrl-/:toggle-preview'"

  export FZF_ALT_C_OPTS="\
--scheme=path \
--preview='${_fzf_preview_dir}'"

  export FZF_CTRL_R_OPTS="\
--scheme=history \
--preview='echo {}' \
--preview-window=down,3,wrap,hidden \
--bind='ctrl-/:toggle-preview'"

  if [[ -n $_fzf_copy ]]; then
    export FZF_CTRL_R_OPTS="${FZF_CTRL_R_OPTS} \
--bind='ctrl-y:execute-silent(echo -n {2..} | ${_fzf_copy})+abort'"
  fi
}

# Live ripgrep → fzf → open file:line in $EDITOR
rif() {
  (( $+commands[rg] )) || {
    print -u2 'rif: ripgrep (rg) not found'
    return 1
  }

  local selection file rest line
  local preview_cmd='cat {1}'
  if (( $+commands[bat] )); then
    preview_cmd='bat --style=numbers --color=always --highlight-line {2} {1}'
  elif (( $+commands[batcat] )); then
    preview_cmd='batcat --style=numbers --color=always --highlight-line {2} {1}'
  fi

  selection="$(
    rg --color=always --line-number --no-heading --smart-case "${*:-.}" |
      fzf --ansi \
        --delimiter : \
        --preview "$preview_cmd" \
        --preview-window 'up,60%,border-bottom,+{2}+3/3,~3'
  )" || return

  file="${selection%%:*}"
  rest="${selection#*:}"
  line="${rest%%:*}"
  ${EDITOR:-nvim} "+${line}" "$file"
}

_dotfiles_fzf_setup
unfunction _dotfiles_fzf_setup
