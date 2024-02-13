return {
  "bfredl/nvim-ipy",
  config = function()
    vim.g.ipy_celldef = '^# %%'
    vim.cmd([[command! -nargs=0 RunQtConsole call jobstart("jupyter qtconsole --JupyterWidget.include_other_output=True")]])
    vim.g.nvim_ipy_perform_mappings = 0
    vim.keymap.set({"n"}, "<leader>rqt", "<cmd>RunQtConsole<CR>")
    vim.keymap.set({"n"}, "<leader>rk", "<cmd>IPython --existing --no-window<CR>")
    vim.keymap.set({"n"}, "<leader>rc", "<Plug>(IPy-RunCell)")
  end 
}
