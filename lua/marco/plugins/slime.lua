return 	{
  "jpalardy/vim-slime",
  init = function()
    vim.b["quarto_is_" .. "python" .. "_chunk"] = false
    Quarto_is_in_python_chunk = function()
      require("otter.tools.functions").is_otter_language_context("python")
    end

    vim.cmd([[
    let g:slime_dispatch_ipython_pause = 100
    function SlimeOverride_EscapeText_quarto(text)
    call v:lua.Quarto_is_in_python_chunk()
    if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk
    return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
    else
    return a:text
    end
    endfunction
    ]])

    vim.b.slime_cell_delimiter = "# %%"
    vim.g.slime_no_mappings = 1

    -- slime, tmux
    vim.g.slime_target = "tmux"
    vim.g.slime_bracketed_paste = 1
    vim.g.slime_default_config = { socket_name = "default", target_pane = "2" }
    vim.g.slime_dont_ask_default = 1

  end,
}
