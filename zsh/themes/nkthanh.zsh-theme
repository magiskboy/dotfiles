# Created by Armin Ronacher github@mitsuhiko
setopt prompt_subst
# export LS_COLORS=ExGxFxDxCxHxHxCbCeEbEb

PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)$(branch_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[cyan]%}git%{$reset_color%}:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]?%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[cyan]%}%{+%G%}"

ZSH_THEME_VIRTUALENV_PREFIX=" workon %{$fg[red]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_color%}"

# This is the basic prompt that is always printed.  It will be
# enclosed to make it newline.
# _MITSUHIKO_PROMPT=$_MITSUHIKO_PROMPT'%{$fg_bold[magenta]%}%n%{$reset_color%}'
_MITSUHIKO_PROMPT=$_MITSUHIKO_PROMPT'%{$fg_bold[green]%}% %(7~|.../%6~|%~)%{$reset_color%}'


# This is the base prompt that is rendered sync.  It should be
# fast to render as a result.  The extra whitespace before the
# newline is necessary to avoid some rendering bugs.
PROMPT=$_MITSUHIKO_PROMPT$'$ '
RPROMPT=''

# The pid of the async prompt process and the communication file
_MITSUHIKO_ASYNC_PROMPT=1
_MITSUHIKO_ASYNC_PROMPT_FN="/tmp/.zsh_tmp_prompt_$$"
#
# # Remove the default git var update from chpwd and precmd to speed
# # up the shell prompt.  We will do the precmd_update_git_vars in
# # the async prompt instead
chpwd_functions=("${(@)chpwd_functions:#chpwd_update_git_vars}")
precmd_functions=("${(@)precmd_functions:#precmd_update_git_vars}")

# This here implements the async handling of the prompt.  It
# runs the expensive git parts in a subprocess and passes the
# information back via tempfile.
function _mitsuhiko_precmd() {
  _mitsuhiko_rv=$?

  function async_prompt() {
    # Run the git var update here instead of in the parent
    precmd_update_git_vars

    #
    echo -n $''$_MITSUHIKO_PROMPT$(git_super_status)$(virtualenv_prompt_info) > $_MITSUHIKO_ASYNC_PROMPT_FN
    if [[ x$_mitsuhiko_rv != x0 ]]; then
      echo -n " exited %{$fg[red]%}$_mitsuhiko_rv%{$reset_color%}" >> $_MITSUHIKO_ASYNC_PROMPT_FN
    fi
    echo -n $'\n😎 ' >> $_MITSUHIKO_ASYNC_PROMPT_FN

    # signal parent
    kill -s USR1 $$
  }

  # If we still have a prompt async process we kill it to make sure
  # we do not backlog with useless prompt things.  This also makes
  # sure that we do not have prompts interleave in the tempfile.
  if [[ "${_MITSUHIKO_ASYNC_PROMPT}" != 0 ]]; then
    kill -s HUP $_MITSUHIKO_ASYNC_PROMPT >/dev/null 2>&1 || :
  fi

  # start background computation
  async_prompt &!
  _MITSUHIKO_ASYNC_PROMPT=$!
}

# This is the trap for the signal that updates our prompt and
# redraws it.  We intentionally do not delete the tempfile here
# so that we can reuse the last prompt for successive commands
function _mitsuhiko_trapusr1() {
  PROMPT="$(cat $_MITSUHIKO_ASYNC_PROMPT_FN)"
  _MITSUHIKO_ASYNC_PROMPT=0
  zle && zle reset-prompt
}

# Make sure we clean up our tempfile on exit
function _mitsuhiko_zshexit() {
  rm -f $_MITSUHIKO_ASYNC_PROMPT_FN
}

# Hook our precmd and zshexit functions and USR1 trap
precmd_functions+=(_mitsuhiko_precmd)
zshexit_functions+=(_mitsuhiko_zshexit)
trap '_mitsuhiko_trapusr1' USR1
