return {
	{
		"jpalardy/vim-slime",
    ft = { "python", "quarto" },
		init = function()
			vim.b.slime_cell_delimiter = "# %%"

			-- Define a function to check if inside a Python chunk
			vim.api.nvim_set_var("Quarto_is_in_python_chunk", function()
				return require("otter.tools.functions").is_otter_language_context("python")
			end)

			-- Override escape text function for Quarto
			vim.cmd([[
                let g:slime_dispatch_ipython_pause = 100
                function! SlimeOverride_EscapeText_quarto(text)
                    call v:lua.Quarto_is_in_python_chunk()
                    if exists('g:slime_python_ipython') && len(split(a:text, "\n")) > 1 && b:quarto_is_python_chunk
                        return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
                    else
                        return a:text
                    endif
                endfunction
            ]])

			-- Slime settings
			vim.g.slime_no_mappings = 1
			vim.g.slime_target = "tmux"
			vim.g.slime_bracketed_paste = 1
			vim.g.slime_default_config = { socket_name = "default", target_pane = "2" }
			vim.g.slime_dont_ask_default = 1
		end,
	},
	{
		"GCBallesteros/jupytext.nvim",
    ft = { "python", "quarto" },
		opts = {
			style = "hydrogen",
			custom_language_formatting = {
				python = {
					extension = "qmd", -- or "md"
					style = "quarto", -- or "markdown"
					force_ft = true, -- or false
				},
			},
		},
	},
}
