return {
	{
		"GCBallesteros/jupytext.nvim",
		opts = {
			style = "hydrogen",
			custom_language_formatting = {
				python = {
					extension = "qmd", -- "qmd" or "md"
					style = "quarto", -- "quarto" or "markdown"
					force_ft = true, -- true or false / "quarto" or "markdown"
				},
			},
		},
	},
	{
		"GCBallesteros/NotebookNavigator.nvim",
		dependencies = {
			"echasnovski/mini.comment",
			-- "hkupty/iron.nvim", -- repl provider
			-- "akinsho/toggleterm.nvim", -- alternative repl provider
			-- "benlubas/molten-nvim", -- alternative repl provider
			"anuvyklack/hydra.nvim",
		},
		opts = {
			-- Code cell marker. Cells start with the marker and end either at the beginning
			-- of the next cell or at the end of the file.
			-- By default, uses language-specific double percent comments like `# %%`.
			-- This can be overridden for each language with this setting.
			cell_markers = {
				python = "# %%",
			},
			-- If not `nil` the keymap defined in the string will activate the hydra head
			activate_hydra_keys = nil,
			-- If `true` a hint panel will be shown when the hydra head is active
			show_hydra_hint = true,
			-- Mappings while the hydra head is active.
			hydra_keys = {
				comment = "c",
				run = "X",
				run_and_move = "x",
				move_up = "k",
				move_down = "j",
				add_cell_before = "a",
				add_cell_after = "b",
				split_cell = "s",
			},
			-- The repl plugin with which to interface
			-- Current options: "iron" for iron.nvim, "toggleterm" for toggleterm.nvim,
			-- "molten" for molten-nvim or "auto" which checks which of the above are
			-- installed
			repl_provider = "auto",
			-- Syntax based highlighting. If you don't want to install mini.hipattners or
			-- enjoy a more minimalistic look
			syntax_highlight = false,
			-- (Optional) for use with `mini.hipatterns` to highlight cell markers
			cell_highlight_group = "Folded",
		},
		event = "VeryLazy",
		config = function()
			local nn = require("notebook-navigator")
			nn.setup({ activate_hydra_keys = "<leader>j" })
		end,
	},
}
