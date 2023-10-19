return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end

		local colors = {
			blue = "#65D1FF",
			green = "#3EFFDC",
			violet = "#FF61EF",
			yellow = "#FFDA7B",
			orange = "#ff9e64",
			red = "#FF4A4A",
			fg = "#c3ccdc",
			bg = "#112638",
			inactive_bg = "#2c3043",
		}

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

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_lsp" },
			sections = { "error", "warn", "info", "hint" },
			symbols = { error = " ", warn = " ", info = " ", hint = "󰠠 " },
			diagnostics_color = {
				-- Same values as the general color option can be used here.
				error = { fg = colors.red },
				warn = { fg = colors.orange }, -- Changes diagnostics' warn color.
				info = { fg = colors.blue }, -- Changes diagnostics' info color.
				-- hint = { fg = colors.yellow }, -- Changes diagnostics' hint color.
			},
			colored = true,
			always_visible = false,
		}

		local diff = {
			"diff",
			colored = true,
			diff_color = {
				-- Same color values as the general color option can be used here.
				-- added = { fg = colors.green },
				modified = { fg = "FFFF33" },
				-- removed = { fg = colors.red },
			},
			symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
			cond = hide_in_width,
		}

		local filetype = {
			"filetype",
			icons_enabled = true,
		}

		local function getWords()
			return tostring(vim.fn.wordcount().words)
		end

		local lazy_status_config = {
			lazy_status.updates,
			cond = lazy_status.has_updates,
			-- color = { fg = "#ff9e64" },
		}

		local date = {
			"datetime",
			-- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
			style = "%H:%M:%S",
		}

		lualine.setup({
			options = {
				globalstatus = true,
				icons_enabled = true,
				theme = my_lualine_theme, -- ( "ayu_dark" | my_lualwne_theme ),
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard" },
				always_divide_middle = true,
			},
			sections = {
				-- Left
				lualine_a = { "mode" },
				lualine_b = { "filename" },
				lualine_c = { diagnostics },
				-- Right
				lualine_x = {
					lazy_status_config,
					diff,
					"encoding",
					"fileformat",
					filetype,
				},
				lualine_y = { getWords, "progress" },
				lualine_z = { date },
			},
		})
	end,
}
