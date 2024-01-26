return {
  -- {
  --   -- config from: https://web.archive.org/web/20200428030840/https://www.blog.gambitaccepted.com/2020/04/26/neovim-qtconsole-setup/
  --   "bfredl/nvim-ipy",
  --   config = function()
  --       vim.g.ipy_celldef = '# %%' -- regex for cell start and end
  --       vim.g.nvim_ipy_perform_mappings = 0
  --
  --       -- Function to run the QtConsole command
  --       function RunQtConsole()
  --           vim.fn.jobstart("jupyter qtconsole --JupyterWidget.include_other_output=True", {detach = true})
  --       end
  --
  --       -- Key mapping for running QtConsole
  --       -- vim.api.nvim_set_keymap('n', '<leader>jqt', [[:lua RunQtConsole()<CR>]], { noremap = true, silent = true })
  --       vim.api.nvim_set_keymap('n', '<silent><c-s>', '<Plug>(IPy-Run)', { noremap = true, silent = true })
  --       vim.api.nvim_set_keymap('n', '<leader>rc', '<Plug>(IPy-RunCell)', { noremap = true })
  --   end,
  -- },
  {
    "GCBallesteros/NotebookNavigator.nvim",
    keys = {
      { "]h", function() require("notebook-navigator").move_cell "d" end },
      { "[h", function() require("notebook-navigator").move_cell "u" end },
      { "<leader>X", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
      { "<leader>x", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
    },
    dependencies = {
      "echasnovski/mini.comment",
      -- "hkupty/iron.nvim", -- repl provider
      "akinsho/toggleterm.nvim", -- alternative repl provider
      -- "benlubas/molten-nvim", -- alternative repl provider
      "anuvyklack/hydra.nvim",
    },
    opts = {
      repl_provider = "toggleterm"
    },
    event = "VeryLazy",
    config = function()
      local nn = require "notebook-navigator"
      nn.setup({ activate_hydra_keys = "<leader>h" })
    end,
  },
  {
    "GCBallesteros/jupytext.nvim",
    config = true,
    -- Depending on your nvim distro or config you may need to make the loading not lazy
    -- lazy=false,
    style = "hydrogen",
    output_extension = "auto",  -- Default extension. Don't change unless you know what you are doing
    force_ft = nil,  -- Default filetype. Don't change unless you know what you are doing
    -- custom_language_formatting = {
    --   python = {
    --     extension = "md",
    --     style = "markdown",
    --     force_ft = "markdown", -- you can set whatever filetype you want here
    --   },
    -- },
  },
}
