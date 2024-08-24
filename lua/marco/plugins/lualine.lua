return {
	"nvim-lualine/lualine.nvim",
	config = function()
		-- Import required modules
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		-- Function to hide components in narrow windows
		local hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end

		-- Define a color scheme
		local colors = {
			blue = "#65D1FF",
			green = "#3EFFDC",
			violet = "#FF61EF",
			yellow = "#FFDA7B",
			orange = "#ff9e64",
			red = "#FF4A4A",
			fg = "#c3ccdc",
			bg = "black", -- "#112638",
			inactive_bg = "#2c3043",
			white = "white",
		}

		-- Define custom theme
		local my_lualine_theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.green, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			command = {
				a = { bg = colors.red, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.red, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
				b = { bg = colors.inactive_bg, fg = colors.semilightgray },
				c = { bg = colors.inactive_bg, fg = colors.semilightgray },
			},
		}

		-- Diagnostics component
		local diagnostics = {
			"diagnostics",
			sources = { "nvim_lsp" },
			sections = { "error", "warn", "info", "hint" },
			symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
			diagnostics_color = {
				error = { fg = colors.red },
				warn = { fg = colors.yellow },
				info = { fg = colors.blue },
			},
			colored = true,
			always_visible = false,
		}

		-- Diff component
		local diff = {
			"diff",
			colored = true,
			diff_color = {
				-- added = { fg = colors.green },
				modified = { fg = "FFFF33" },
				-- removed = { fg = colors.red },
			},
			symbols = { added = " ", modified = " ", removed = " " },
			cond = hide_in_width,
		}

		local filetype = {
			"filetype",
			icons_enabled = true,
		}

		local function getWords()
			return tostring(vim.fn.wordcount().words)
		end

		-- Lazy status component
		local lazy_status_config = {
			lazy_status.updates,
			cond = lazy_status.has_updates,
		}

		-- Date and time component
		local date = { "datetime", style = "%H:%M:%S" }

		-- Macro recording indicator
		local function macro_recording()
			local reg = vim.fn.reg_recording()
			return reg ~= "" and "📷[" .. reg .. "]" or ""
		end

		local buffers = {
			"buffers",
			mode = 0, -- 0: Shows buffer name
			-- 1: Shows buffer index
			-- 2: Shows buffer name + buffer index
			-- 3: Shows buffer number
			-- 4: Shows buffer name + buffer number
			symbols = {
				modified = " ●", -- Text to show when the buffer is modified
				alternate_file = "", -- Text to show to identify the alternate file
				directory = "", -- Text to show when the buffer is a directory
			},
			buffers_color = {
				-- Same values as the general color option can be used here.
				active = { bg = "#112638", fg = colors.white }, -- color for active buffer
				inactive = { bg = colors.bg, fg = colors.white }, -- color for inactive buffer
			},
		}

		require("lualine").setup({
			options = {
				globalstatus = true,
				icons_enabled = true,
				theme = my_lualine_theme, -- ( "ayu_dark" | my_lualwne_theme ),
				component_separators = "", -- { left = "", right = "" },
				section_separators = "", -- { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { "mode", macro_recording },
				lualine_b = { "branch" },
				lualine_c = { diff },
				lualine_x = {
					diagnostics,
					lazy_status_config,
					filetype,
					"copilot",
				},
				lualine_y = { getWords, "progress" },
				lualine_z = { date },
			},
			tabline = {
				lualine_b = { buffers },
			},
			extensions = { "nvim-tree" },
		})
	end,
}
