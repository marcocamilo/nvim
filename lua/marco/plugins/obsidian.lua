return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	-- ft = "markdown",
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		"BufReadPre /Users/marcocamilo/Documents/marco_camilo/*",
		"BufNewFile /Users/marcocamilo/Documents/marco_camilo/*",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		ui = { enable = false },
		workspaces = {
			{
				name = "marco_camilo",
				path = "~/Documents/marco_camilo",
			},
		},
		daily_notes = {
			folder = "daily/",
		},
		disable_frontmatter = true,
		note_id_func = function(title)
			if title ~= nil then
				title = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
        title = tostring(os.time()) .. "-new_note"
			end
			return title
		end,
	},
}
