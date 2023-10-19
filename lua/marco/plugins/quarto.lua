return {
	"quarto-dev/quarto-nvim",
	dev = false,
	dependencies = {
		{
			"jmbuhr/otter.nvim",
			dependencies = {
				{ "neovim/nvim-lspconfig" },
			},
			dev = false,
			-- opts = {
			-- 	lsp = {
			-- 		hover = {
			-- 			border = require("misc.style").border,
			-- 		},
			-- 	},
			-- },
		},
	},
	opts = {
		lspFeatures = {
			languages = { "r", "python", "julia", "bash", "lua", "html" },
		},
	},
}
