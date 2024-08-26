return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					autotrigger = true,
					keymap = {
						accept = "<C-f>",
						accept_word = "<C-l>",
						accept_line = "<C-j>",
						next = "<C-]>",
						prev = "<C-[>",
						dismiss = "<Esc>",
            toggle = "<C-\\>",
					},
				},
				panel = { enabled = true },
				filetypes = {
					yaml = false,
					markdown = true,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
				copilot_node_command = "node", -- Node.js version must be > 18.x
				server_opts_overrides = {},
			})
		end,
	},
	{
		"AndreM222/copilot-lualine",
	},
}
