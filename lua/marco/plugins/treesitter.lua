return {
  "nvim-treesitter/nvim-treesitter",
  tag = nil,
  branch = "master",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      ensure_installed = {
        "json",
        "javascript",
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
        "gitignore"
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
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
