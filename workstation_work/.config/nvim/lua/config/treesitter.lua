require("nvim-treesitter.configs").setup(
    {
        ensure_installed = {
            "bash",
            "c",
            "comment",
            "css",
            "dockerfile",
            "eex",
            "elixir",
            "erlang",
            "go",
            "heex",
            "lua",
            "html",
            "yaml",
        },
        highlight = {enable = true, additional_vim_regex_highlighting = false},
        incremental_selection = {enable = true},
        indent = {enable = true},
        textobjects = {enable = true}
    }
)
