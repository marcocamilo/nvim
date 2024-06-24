return {
  { 
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
          "bash",
          "css",
          "dot",
          "gitignore",
          "html",
          "javascript",
          "json",
          "julia",
          "latex",
          "lua",
          "markdown",
          "markdown_inline",
          "org",
          "python",
          "query",
          "r",
          "toml",
          "vim",
          "vimdoc",
          "yaml",
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
  },
  {
    "nikvdp/ejs-syntax",
  },
}
