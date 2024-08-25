return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  lazy = true,
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
      textobjects = {
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = { query = "@call.outer", desc = "Next function call start" },
            ["]m"] = { query = "@function.outer", desc = "Next definition start" },
            ["]]"] = { query = "@codechunk.outer", desc = "Next code chunk start" },
            ["]c"] = { query = "@class.outer", desc = "Next class start" },
            ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
            ["]l"] = { query = "@loop.outer", desc = "Next loop start" },
          },
          goto_previous_start = {
            ["[f"] = { query = "@call.outer", desc = "Prev function call start" },
            ["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
            ["[["] = { query = "@codechunk.outer", desc = "Prev code chunk start" },
            ["[c"] = { query = "@class.outer", desc = "Prev class start" },
            ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
            ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
          },
        },
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["ac"] = "@codechunk.outer",
            ["ic"] = "@codechunk.inner",
          },
        },
      },
    })
  end
}
