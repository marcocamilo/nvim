return {
  "jpalardy/vim-slime",
  init = function()
    vim.g.slime_target = "tmux"
    vim.g.slime_cell_delimiter = "# %%"
  end,
  -- init = function()
  --   vim.g.slime_target = "x11"
  --   vim.g.slime_x11_lf_to_cr = 1
  -- end,
  -- config = function()
  --   function SlimeOverride_EscapeText_python(text)
  --     local escaped_text = _EscapeText_python(text)
  --     if vim.g.slime_target:find("x11") and vim.g.slime_x11_lf_to_cr then
  --       return escaped_text:gsub('\n', '\r')
  --     end
  --     return escaped_text
  --   end
  -- end
}
