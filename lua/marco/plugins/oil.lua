return {
	"stevearc/oil.nvim",
	-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	opts = {
		columns = {
			"icon",
			-- "size",
			-- "permissions",
		},
		use_default_keymaps = false,
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
		-- 		["<C-l>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
				["gs"] = "actions.change_sort",
		-- 		["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				-- ["g\\"] = "actions.toggle_trash",
			},
	},
}
