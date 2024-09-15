return {
	"folke/which-key.nvim",
  commit = "f5b912451f33fd19e52230e73617ad099ffd3ab1",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300

		local setup = {
			plugins = {
				marks = true,
				registers = true,
				spelling = { enabled = true, suggestions = 20 },
				presets = {
					operators = false,
					motions = true,
					text_objects = true,
					windows = true,
					nav = true,
					z = true,
					g = true,
				},
			},
			operators = { gc = "Comments" },
			motions = { count = true },
			icons = {
				breadcrumb = "»",
				separator = "➜",
				group = "+",
			},
			window = {
				border = "none",
				position = "bottom",
				margin = { 1, 0, 1, 0 },
				padding = { 1, 2, 1, 2 },
				winblend = 0,
				zindex = 1000,
			},
			layout = {
				height = { min = 4, max = 25 },
				width = { min = 20, max = 50 },
				spacing = 3,
				align = "left",
			},
			ignore_missing = false,
			hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " },
			show_help = true,
			show_keys = true,
			triggers = "auto",
			triggers_nowait = { "`", "'", "g`", "g'", '"', "<c-r>", "z=" },
			triggers_blacklist = {
				n = { "v" },
				i = { "j", "k" },
				v = { "j", "k" },
			},
			disable = {
				buftypes = {},
				filetypes = {},
			},
		}

		local nopts = {
			mode = "n",
			prefix = "<leader>",
			silent = true,
			noremap = true,
		}

		local vopts = {
			mode = "v",
			prefix = "<leader>",
			silent = true,
			noremap = true,
		}

		local n_mappings = {
			["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
			-- ["e"] = { "<cmd>Oil<cr>", "Explorer (Oil)" },
			["f"] = { "<cmd>Telescope find_files<CR>", "Find files" },
			["F"] = { "<cmd>Telescope live_grep<CR>", "Find Text" },
			["p"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
			["b"] = { "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Buffers" },
			["L"] = { "<cmd>Lazy<CR>", "Lazy" },
			["M"] = { "<cmd>Mason<CR>", "Mason" },
			["lg"] = { "<cmd>LazyGit<CR>", "LazyGit" },
			["o"] = { "<cmd>Outline<CR>", "Toggle Outline" },
			m = {
				name = "Markdown",
				v = { "<cmd>MarkdownPreviewToggle<CR>", "Markdown Preview" },
				h = { "<cmd>MarkdownHeaders<CR>", "Markdown Headers" },
				t = { "<cmd>MDInsertToc<CR>", "Insert TOC" },
			},
      n = {
        name = "Obsidian",
        n = { "<cmd>ObsidianNew<CR>", "Create New Note" },
        b = { "<cmd>ObsidianBacklinks<CR>", "Note Backlinks" },
        s = { "<cmd>ObsidianSearch<CR>", "Note Search" },
      },
			l = {
				name = "LSP",
				a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
				d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Buffer Diagnostics" },
				D = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Line Diagnostics" },
				w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
				f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format buffer" },
				i = { "<cmd>LspInfo<cr>", "Info" },
				l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
				q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
				R = { "<cmd>LspRestart<CR>", "Restart LSP" },
				s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
			},
			[";"] = {
				name = "Noice",
				l = { "<cmd>Noice last<cr>", "See last message" },
				h = { "<cmd>Telescope notify<cr>", "Message history" },
				a = { "<cmd>Noice all<cr>", "See all messages" },
				d = { "<cmd>Noice dismiss<cr>", "Dismiss all messages" },
				e = { "<cmd>Noice errors<cr>", "See all error messages" },
			},
			["?"] = {
				name = "Search",
				c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
				h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
				M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
				n = { "<cmd>Nerdy<cr>", "Nerd Fonts" },
				r = { "<cmd>SearchBoxReplace confirm=native<cr>", "Search and Replace" },
				R = { "<cmd>Telescope registers<cr>", "Registers" },
				k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
				C = { "<cmd>Telescope commands<cr>", "Commands" },
				s = { "<cmd>set spell!<cr>", "Spell check" },
				["?"] = { "<cmd>Cheatsheet<CR>", "Cheatsheet" },
			},
			s = { "<Plug>SlimeMotionSend", "Send to iPython with motion" },
			["sl"] = { "<cmd>SlimeSendCurrentLine<CR>", "Send Current Line" },
			c = {
				b = {
					name = "Comment Box",
					l = { "<cmd>CBllbox<CR>", "Left aligned text" },
					c = { "<cmd>CBlcbox<CR>", "Center aligned text" },
					r = { "<cmd>CBlrbox<CR>", "Right aligned text" },
				},
				a = { "<cmd>Copilot suggestion<CR>", "Copilot suggestions" },
				p = { "<cmd>Copilot panel<CR>", "Copilot panel" },
				s = { "<cmd>Copilot status<CR>", "Copilot status" },
				e = { "<cmd>Copilot enable<CR>", "Copilot enable" },
				d = { "<cmd>Copilot disable<CR>", "Copilot disable" },
				i = { "<cmd>ConformInfo<CR>", "Conform Info" },
			},
			t = {
				x = {
					name = "VimTeX",
					c = { "<cmd>VimtexCompile<CR>", "VimTeX Compile" },
					q = { "<cmd>VimtexStop<CR>", "VimTeX Stop" },
					v = { "<cmd>VimtexView<CR>", "VimTeX View" },
					l = { "<cmd>VimtexLog<CR>", "VimTeX Log" },
					i = { "<cmd>VimtexInfo<CR>", "VimTeX Info" },
					e = { "<cmd>VimtexErrors<CR>", "VimTeX Errors" },
				},
				v = { "<cmd>ToggleTerm direction=vertical size=55 name=vertical<CR>", "Toggle Term Vertical" },
				h = { "<cmd>ToggleTerm direction=horizontal name=horizontal<CR>", "Toggle Term Horizontal" },
				t = { "<cmd>ToggleTerm direction=float<CR>", "Toggle Term Center" },
			},
			["4"] = {
				name = "Quarto",
				a = { "<cmd>QuartoActivate<CR>", "Quarto Activate" },
				p = { "<cmd>QuartoPreview<CR>", "Quarto Preview" },
				cp = { "<cmd>QuartoClosePreview<CR>", "Quarto Close Preview" },
				h = { "<cmd>QuartoHelp ", "Quarto Help" },
				r = { "<cmd>!quarto render %<CR>", "Quarto Render" },
			},
		}

		local v_mappings = {
			t = {
				name = "Toggle Term",
				s = {
					name = "Toggle Term Send",
					l = { "<cmd>ToggleTermSendVisualLines<CR>", "Send Visual Lines" },
					s = { "<cmd>ToggleTermSendVisualSelection<CR>", "Send Visual Selection" },
					p = { "<cmd>ToggleTermSendCurrentLine<CR>", "Send Line" },
				},
			},
			s = { "<Plug>SlimeRegionSend<CR>", "Send to iPython" },
			c = {
				b = {
					name = "Comment Box",
					l = { "<cmd>'<,'>CBllbox<CR>", "Left aligned text" },
					c = { "<cmd>'<,'>CBlcbox<CR>", "Center aligned text" },
					r = { "<cmd>'<,'>CBlrbox<CR>", "Right aligned text" },
				},
			},
		}

		local wk = require("which-key")
		wk.setup(setup)
		wk.register(n_mappings, nopts)
		wk.register(v_mappings, vopts)
	end,
}
