return {
	"nvim-telescope/telescope.nvim",
	-- commit = vim.fn.has("nvim-0.9.0") == 0 and "057ee0f8783" or nil,
	branch = "0.1.x",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
  { "nvim-telescope/telescope-file-browser.nvim" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
        file_ignore_patterns = {
          "node_modules",
          "%_files/*.html",
          "%_cache",
          ".git/",
          "site_libs",
          ".venv",
        },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<esc>"] = actions.close, -- close
					},
				},
			},
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
        find_files = {
          -- theme = "dropdown",
          hidden = false,
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--glob",
            "!.git/*",
            "--glob",
            "!**/.Rproj.user/*",
            "--glob",
            "!_site/*",
            "--glob",
            "!docs/**/*.html",
            "-L",
          },
        },
        live_grep = {
          theme = "dropdown",
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
