# Unify CLI names across macOS / Linux distros (Debian renames, etc.).
# Only alias when the canonical binary is missing but a distro name exists.
# Aliases do not affect $+commands; set related env here when needed.

# fd: Debian/Ubuntu ship `fdfind` (package fd-find)
if (( !$+commands[fd] )) && (( $+commands[fdfind] )); then
  alias fd=fdfind
  # fzf plugin checks $+commands[fd]; pre-set so it still uses fd-find
  : ${FZF_DEFAULT_COMMAND:='fdfind --type f --hidden --follow --exclude .git'}
  export FZF_DEFAULT_COMMAND
  : ${FZF_CTRL_T_COMMAND:=$FZF_DEFAULT_COMMAND}
  export FZF_CTRL_T_COMMAND
  : ${FZF_ALT_C_COMMAND:='fdfind --type d --hidden --follow --exclude .git'}
  export FZF_ALT_C_COMMAND
fi

# bat: some Debian/Ubuntu packages install `batcat`
if (( !$+commands[bat] )) && (( $+commands[batcat] )); then
  alias bat=batcat
fi

# eza: older installs may still have `exa`
if (( !$+commands[eza] )) && (( $+commands[exa] )); then
  alias eza=exa
fi

# open: macOS has /usr/bin/open; Linux uses xdg-open
if [[ "$OSTYPE" == linux* ]] && (( !$+commands[open] )) && (( $+commands[xdg-open] )); then
  alias open=xdg-open
fi
