require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",
        "lua",
        "vim",
        "query",
        "python",
        "go",
        "javascript",
        "typescript",
        "html",
        "css",
        "sql",
        "tsx",
        "bash"
    },
    modules = {},
    sync_install = false,
    ignore_install = {},
    auto_install = true,
    highlight = {
        enable = true,
    },
}
