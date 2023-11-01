return {
  {
    "bluz71/vim-nightfly-guicolors",
    name = "nightfly",
    priority = 1000, -- make sure to load this before all the other start plugins
    lazy = false,
  },
  {
    "alexanderbluhm/black.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      term_colors = true,
      transparent_background = false,
      no_italic = false,
      no_bold = false,
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      color_overrides = {
        all = {
          text = "#ffffff",
        },
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
    },
    -- config = function(_, opts)
    --   require("catppuccin").setup(opts)
    --   vim.cmd.colorscheme("catppuccin-mocha")
    -- end,
  },
  {
    "askfiy/visual_studio_code",
    priority = 1000,
    opts = {
      mode = "dark",
    }
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github_dark_high_contrast",
    priority = 1000, -- make sure to load this before all the other start plugins
  }
}
