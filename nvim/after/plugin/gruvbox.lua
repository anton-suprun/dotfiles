require'gruvbox'.setup {
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {
        SignColumn = {
            bg = "#f9f5d7",
        },
        EndOfBuffer = {
            fg = "#f9f5d7"
        }
    },
    dim_inactive = false,
    transparent_mode = false,
}
vim.cmd("colorscheme gruvbox")
