local nightfly = {
	"bluz71/vim-nightfly-guicolors",
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		-- load the colorscheme here
		vim.cmd.colorscheme("nightfly")
	end,
}

local black = {
	"alexanderbluhm/black.nvim",
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		-- load the colorscheme here
		vim.cmd.colorscheme("black")
	end,
}

local catppuccin = {
	"catppuccin/nvim",
	priority = 1000,
	opts = {
		flavour = "mocha", -- latte, frappe, macchiato, mocha
		term_colors = true,
		transparent_background = false,
		no_italic = false,
		no_bold = false,
		styles = {
			comments = {},
			conditionals = {},
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
		},
		color_overrides = {
			all = {
				text = "#ffffff",
			},
			mocha = {
				base = "#000000",
				mantle = "#000000",
				crust = "#000000",
			},
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}

local vscode = {
	"askfiy/visual_studio_code",
	priority = 100,
	config = function()
		require("visual_studio_code").setup({
			mode = "dark",
		})
	end,
}

local github_dark = {
	"projekt0n/github-nvim-theme",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("github-theme").setup({
			-- ...
		})

		vim.cmd("colorscheme github_dark_high_contrast")
	end,
}

------------------

local theme = catppuccin

return { theme }
