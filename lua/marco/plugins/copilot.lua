return {
  -- "zbirenbaum/copilot.lua",
  -- cmd = "Copilot",
  -- event = "InsertEnter",
  -- config = function()
  --   require('copilot').setup({
  --     panel = {
  --       enabled = true,
  --       auto_refresh = false, -- suggestions are refreshed as you type in the buffer
  --       keymap = {
  --         jump_prev = "[[",
  --         jump_next = "]]",
  --         accept = "<CR>",
  --         refresh = "R",
  --         open = "<leader>cp"
  --       },
  --       layout = {
  --         position = "right", -- | top | left | right | bottom
  --         ratio = 0.4
  --       },
  --     },
  --     suggestion = {
  --       enabled = true,
  --       auto_trigger = false, -- starts suggesting in insert mode or use the next or prev to trigger suggestion
  --       debounce = 75,
  --       keymap = {
  --         accept = "<leader>ca",
  --         accept_word = false,
  --         accept_line = false,
  --         next = "]]",
  --         prev = "[[",
  --         dismiss = "<leader>cd",
  --       },
  --     },
  --     filetypes = {
  --       yaml = false,
  --       markdown = false,
  --       help = false,
  --       gitcommit = false,
  --       gitrebase = false,
  --       hgcommit = false,
  --       svn = false,
  --       cvs = false,
  --       ["."] = false,
  --     },
  --     copilot_node_command = 'node', -- Node.js version must be > 18.x
  --     server_opts_overrides = {},
  --   })
  --   end,
}