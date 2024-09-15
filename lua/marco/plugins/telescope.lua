return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				file_ignore_patterns = {
					"node_modules",
					".git/",
					"site_libs",
					".venv",
					"_cache",
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<esc>"] = actions.close,
					},
				},
			},
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
				find_files = {
					hidden = false,
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--glob",
						"!.git/*",
						"-L",
					},
				},
				live_grep = {
					theme = "ivy",
				},
        grep_string = {
          theme = "ivy",
        },
			},
		})

		telescope.load_extension("fzf")
	end,
}
