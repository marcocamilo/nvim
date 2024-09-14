return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = {
			file_types = { "markdown", "quarto" },
			win_options = {
				conceallevel = {
					rendered = 2,
				},
			},
		},
	},
	{
		"tadmccorkle/markdown.nvim",
		ft = { "markdown", "quarto" },
		opts = {
			mappings = {
				go_curr_heading = "g.",
				go_parent_heading = "gp",
				go_next_heading = "]]",
				go_prev_heading = "[[",
			},
		},
	},
	{
		"bullets-vim/bullets.vim",
		ft = { "markdown", "quarto" },
		init = function()
			vim.g.bullets_enabled_file_types = {
				"markdown",
				"quarto",
			}
			vim.g.bullets_set_mappings = 0
			vim.g.bullets_custom_mappings = {
				{ "imap", "<cr>", "<Plug>(bullets-newline)" },
				{ "nmap", "<leader>x", "<Plug>(bullets-toggle-checkbox)" },
				{ "nmap", ">>", "<Plug>(bullets-demote)" },
				{ "nmap", "<<", "<Plug>(bullets-promote)" },
			}
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown", "quarto" }
			vim.g.mkdp_auto_close = true
			vim.g.mkdp_open_to_the_world = false
			vim.g.mkdp_open_ip = "127.0.0.1"
			vim.g.mkdp_port = "8888"
			vim.g.mkdp_echo_preview_url = true
			vim.g.mkdp_page_title = "${name}"
		end,
		ft = { "markdown", "quarto" },
	},
}
