return {
  'lervag/vimtex',
  config = function()
    vim.g.vimtex_compiler_latexmk_engines = {
      _ = "-xelatex",
    }
    vim.g.vimtex_view_method = "sioyek"
    vim.g.vimtex_syntax_enabled = 0
  end,
}
