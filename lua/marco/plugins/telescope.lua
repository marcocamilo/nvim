return {
	"nvim-telescope/telescope.nvim",
	commit = vim.fn.has("nvim-0.9.0") == 0 and "057ee0f8783" or nil,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
		})

		telescope.load_extension("fzf")
	end,
}

-- Old Config
-- 	cmd = "Telescope",
-- 	version = false, -- telescope did only one release, so use HEAD for now
-- 	opts = {
-- 		defaults = {
-- 			prompt_prefix = " ",
-- 			selection_caret = " ",
-- 			mappings = {
-- 				i = {
-- 					["<c-t>"] = function(...)
-- 						return require("trouble.providers.telescope").open_with_trouble(...)
-- 					end,
-- 					["<a-t>"] = function(...)
-- 						return require("trouble.providers.telescope").open_selected_with_trouble(...)
-- 					end,
-- 					["<a-i>"] = function()
-- 						local action_state = require("telescope.actions.state")
-- 						local line = action_state.get_current_line()
-- 						require("lazyvim.util").telescope("find_files", { no_ignore = true, default_text = line })()
-- 					end,
-- 					["<a-h>"] = function()
-- 						local action_state = require("telescope.actions.state")
-- 						local line = action_state.get_current_line()
-- 						require("lazyvim.util").telescope("find_files", { hidden = true, default_text = line })()
-- 					end,
-- 					["<C-Down>"] = function(...)
-- 						return require("telescope.actions").cycle_history_next(...)
-- 					end,
-- 					["<C-Up>"] = function(...)
-- 						return require("telescope.actions").cycle_history_prev(...)
-- 					end,
-- 					["<C-f>"] = function(...)
-- 						return require("telescope.actions").preview_scrolling_down(...)
-- 					end,
-- 					["<C-b>"] = function(...)
-- 						return require("telescope.actions").preview_scrolling_up(...)
-- 					end,
-- 				},
-- 				n = {
-- 					["q"] = function(...)
-- 						return require("telescope.actions").close(...)
-- 					end,
-- 				},
-- 			},
-- 		},
-- 		pickers = {
-- 			colorscheme = {
-- 				enable_preview = true,
-- 			},
-- 		},
-- 	},
-- }