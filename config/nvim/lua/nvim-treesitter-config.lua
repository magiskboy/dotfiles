require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "html",
        "typescript",
        "javascript",
        "tsx",
        "css",
        "scss",
        "python",
        "rust",
        "go",
        "dockerfile",
        "json",
        "yaml",
        "lua",
        "bash",
        "c",
        "cpp",
        "cmake",
        "toml",
        "java",
    },

    highlight = {
        enable = true,
    }
}
