return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(plugin)
    return {
      options = {
        theme = "powerline",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
      },
    }
  end,
}
