return {
	{
		"lukas-reineke/onedark.nvim",
		name = "onedark",
		priority = 1000,
	},
	{
		"bluz71/vim-nightfly-guicolors",
		name = "nightfly",
		priority = 1000,
		lazy = false,
	},
	{
		"alexanderbluhm/black.nvim",
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
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
				integrations = {
					headlines = true,
				},
			},
		},
	},
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		priority = 1000,
		config = function()
			local bg = "#000000"
			local bg_dark = "#011423"
			local bg_highlight = "#143652"
			local bg_search = "#0A64AC"
			local bg_visual = "#275378"
			local fg = "#CBE0F0"
			local fg_dark = "#B4D0E9"
			local fg_gutter = "#627E97"
			local border = "#547998"

			require("tokyonight").setup({
				style = "night",
				on_colors = function(colors)
					colors.bg = bg
					colors.bg_dark = bg_dark
					colors.bg_float = bg_dark
					colors.bg_highlight = bg_highlight
					colors.bg_popup = bg_dark
					colors.bg_search = bg_search
					colors.bg_sidebar = bg
					colors.bg_statusline = bg_dark
					colors.bg_visual = bg_visual
					colors.border = border
					colors.fg = fg
					colors.fg_dark = fg_dark
					colors.fg_float = fg
					colors.fg_gutter = fg_gutter
					colors.fg_sidebar = fg_dark
				end,
			})
			vim.cmd("colorscheme tokyonight")
		end,
	},
	{
		"askfiy/visual_studio_code",
		priority = 1000,
		opts = {
			mode = "dark",
		},
	},
	{
		"projekt0n/github-nvim-theme",
		name = "github_dark_high_contrast",
		priority = 1000,
	},
	{
		"shaunsingh/nord.nvim",
		priority = 1000,
	},
}
