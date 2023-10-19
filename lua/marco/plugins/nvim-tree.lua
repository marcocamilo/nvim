return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- configure nvim-tree
    nvimtree.setup({
      view = {
        width = 30,
        side = "left",
      },
      update_focused_file = {
         enable = true,
         update_cwd = true,
       },
      renderer = {
         root_folder_modifier = ":t",
         icons = {
           glyphs = {
             default = "",
             symlink = "",
             folder = {
               arrow_open = "󰁆",
               arrow_closed = "󰁕",
               default = "",
               open = "",
               empty = "",
               empty_open = "",
               symlink = "",
               symlink_open = "",
             },
             git = {
               unstaged = "",
               staged = "S",
               unmerged = "",
               renamed = "➜",
               untracked = "U",
               deleted = "",
               ignored = "◌",
             },
           },
         },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
    })
  end,
}
