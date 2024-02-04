return {
  "mg979/vim-visual-multi",
  init = function()
      vim.g["VM_default_mappings"] = -1
      vim.g["VM_mouse_mappings"] = 1
      -- vim.g["VM_leader"] = "\\"
      vim.g.VM_maps = {
  --       -- Default Keymappings
          ["Mouse Cursor"] = '<M-LeftMouse>',
      }
  end,
}
