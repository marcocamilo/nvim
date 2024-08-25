return {
-- ┌───────────────────────────────────────────────────────────────────┐
--   NOICE                                                             
-- └───────────────────────────────────────────────────────────────────┘
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim", -- Dependency for UI components
		},
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false,
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},
		},
		keys = {
			{
				"<c-f>",
				function()
					if not require("noice.lsp").scroll(4) then
						return "<c-f>"
					end
				end,
				silent = true,
				expr = true,
				desc = "Scroll forward",
				mode = { "i", "n", "s" },
			},
			{
				"<c-b>",
				function()
					if not require("noice.lsp").scroll(-4) then
						return "<c-b>"
					end
				end,
				silent = true,
				expr = true,
				desc = "Scroll backward",
				mode = { "i", "n", "s" },
			},
		},
	},
-- ┌───────────────────────────────────────────────────────────────────┐
--   NOTIFY                                                            
-- └───────────────────────────────────────────────────────────────────┘
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		opts = {
			stages = "static",
			timeout = 1500,
			max_height = function()
				return math.floor(vim.o.lines * 0.75) -- Smaller height for compact notifications
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75) -- Smaller width for compact notifications
			end,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { zindex = 100 })
			end,
			render = "compact",
		},
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Dismiss all Notifications",
			},
		},
	},
}
