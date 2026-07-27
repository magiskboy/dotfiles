# robbyrussell-style prompt using built-in vcs_info (no Oh My Zsh)

autoload -Uz vcs_info add-zsh-hook

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr ''
zstyle ':vcs_info:*' unstagedstr ' %F{yellow}✗'
zstyle ':vcs_info:git:*' formats '%F{blue}git:(%F{red}%b%F{blue})%u%f'
zstyle ':vcs_info:git:*' actionformats '%F{blue}git:(%F{red}%b%F{blue}|%a)%u%f'

_robbyrussell_precmd() {
  vcs_info
}
add-zsh-hook precmd _robbyrussell_precmd

PROMPT='%(?:%F{green}➜ :%F{red}➜ ) %F{cyan}%c%f ${vcs_info_msg_0_} '
