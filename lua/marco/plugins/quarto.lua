return {
	{
		"quarto-dev/quarto-nvim",
		dev = false,
		dependencies = {
			{
				"jmbuhr/otter.nvim",
				dev = false,
				dependencies = {
					{ "neovim/nvim-lspconfig" },
				},
				opts = {
					lsp = {
						hover = {
							border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
						},
					},
					buffers = {
						-- if set to true, the filetype of the otterbuffers will be set.
						-- otherwise only the autocommand of lspconfig that attaches
						-- the language server will be executed without setting the filetype
						set_filetype = true,
					},
				},
			},
		},
		opts = {
			lspFeatures = {
				languages = { "r", "python", "julia", "bash", "lua", "html", "dot" },
			},
		},
	},

	-- paste an image to markdown from the clipboard
	-- :PasteImg,
	{
		"dfendr/clipboard-image.nvim",
		keys = {
			{ "<leader>ip", ":PasteImg<cr>", desc = "image paste" },
		},
		cmd = {
			"PasteImg",
		},
		config = function()
			require("clipboard-image").setup({
				quarto = {
					img_dir = "img",
					affix = "![](%s)",
				},
			})
		end,
	},

	-- preview equations
	{
		"jbyuki/nabla.nvim",
		-- keys = {
		-- 	{ "<leader>ee", ':lua require"nabla".toggle_virt()<cr>', "toggle equations" },
		-- 	{ "<leader>eh", ':lua require"nabla".popup()<cr>', "hover equation" },
		-- },
	},
}
