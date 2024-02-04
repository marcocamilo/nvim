return 	{
  "nvim-treesitter/nvim-treesitter",
  tag = nil,
  branch = "master",
  run = ":TSUpdate",
  opts = {
    ensure_installed = {
      "r",
      "python",
      "markdown",
      "markdown_inline",
      "julia",
      "bash",
      "yaml",
      "lua",
      "vim",
      "query",
      "vimdoc",
      "latex",
      "html",
      "css",
      "dot",
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
      -- optional (with quarto-vim extension and pandoc-syntax)
      -- additional_vim_regex_highlighting = { 'markdown' },

      -- note: the vim regex based highlighting from
      -- quarto-vim / vim-pandoc sets the wrong comment character
      -- for some sections where there is `$` math.
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
  },
}
