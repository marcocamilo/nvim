return {
	"nvim-lua/plenary.nvim",

	--Tmux and Window Navigation
	"christoomey/vim-tmux-navigator",

	--LF
	"ptzz/lf.vim",
	"voldikss/vim-floaterm",

	-- Repeat with .
	"tpope/vim-repeat",

	-- Kitty Config Highlighting
	"fladson/vim-kitty",

	-- Search Box
	{
		"VonHeikemen/searchbox.nvim",
		dependencies = {
			{ "MunifTanjim/nui.nvim" },
		},
	},

	-- devicons
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").set_icon({
				gql = {
					icon = "",
					color = "#e535ab",
					cterm_color = "199",
					name = "GraphQL",
				},
			})
		end,
	},
}
