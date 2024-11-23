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
}
