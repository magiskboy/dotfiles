# Zellij plugin

This plugin adds zsh completion for [Zellij](https://zellij.dev/), plus helper
functions for running commands and editing files in panes.

To use it, add `zellij` to the plugins array in your zshrc file:

```zsh
plugins=(... zellij)
```

Requires `zellij` on `$PATH`. Completion is written to
`$ZSH_CACHE_DIR/completions/_zellij` (same pattern as the kubectl plugin).
Do not `source <(zellij setup --generate-completion zsh)` — that script ends
with `_zellij "$@"` and will error outside the completion system.

## Helpers

| Function | Description |
| -------- | ----------- |
| `zr`     | Run a command in a new pane (`zellij run`) |
| `zrf`    | Same as `zr`, floating pane |
| `zri`    | Same as `zr`, in-place pane |
| `ze`     | Edit a file in a new pane (`zellij edit`) |
| `zef`    | Same as `ze`, floating pane |
| `zei`    | Same as `ze`, in-place pane |
| `zpipe`  | Call `zellij pipe` (optional plugin id as `$1`) |

### Examples

```zsh
zr 'htop'
zrf 'lazygit'
ze ~/.zshrc
zpipe
```
