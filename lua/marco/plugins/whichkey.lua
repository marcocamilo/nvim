return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		--  ┌────────────────────────────────────────────────────────────────────┐
		--                                  SETUP
		--  └────────────────────────────────────────────────────────────────────┘
		local setup = {
			plugins = {
				marks = true, -- shows a list of your marks on ' and `
				registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				-- the presets plugin, adds help for a bunch of default keybindings in Neovim
				-- No actual key bindings are created
				spelling = {
					enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
					suggestions = 20, -- how many suggestions should be shown in the list?
				},
				presets = {
					operators = false, -- adds help for operators like d, y, ...
					motions = true, -- adds help for motions
					text_objects = true, -- help for text objects triggered after entering an operator
					windows = true, -- default bindings on <c-w>
					nav = true, -- misc bindings to work with windows
					z = true, -- bindings for folds, spelling and others prefixed with z
					g = true, -- bindings for prefixed with g
				},
			},
			-- add operators that will trigger motion and text object completion
			-- to enable all native operators, set the preset / operators plugin above
			operators = { gc = "Comments" },
			key_labels = {
				-- override the label used to display some keys. It doesn't effect WK in any other way.
				-- For example:
				-- ["<space>"] = "SPC",
				-- ["<cr>"] = "RET",
				-- ["<tab>"] = "TAB",
			},
			motions = {
				count = true,
			},
			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "➜", -- symbol used between a key and it's label
				group = "+", -- symbol prepended to a group
			},
			popup_mappings = {
				scroll_down = "<c-d>", -- binding to scroll down inside the popup
				scroll_up = "<c-u>", -- binding to scroll up inside the popup
			},
			window = {
				border = "none", -- none, single, double, shadow
				position = "bottom", -- bottom, top
				margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
				padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
				winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
				zindex = 1000, -- positive value to position WhichKey above other floating windows.
			},
			layout = {
				height = { min = 4, max = 25 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 3, -- spacing between columns
				align = "left", -- align columns left, center or right
			},
			ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
			hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
			show_help = true, -- show a help message in the command line for using WhichKey
			show_keys = true, -- show the currently pressed key and its label as a message in the command line
			triggers = "auto", -- automatically setup triggers
			-- triggers = {"<leader>"} -- or specifiy a list manually
			-- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
			triggers_nowait = {
				-- marks
				"`",
				"'",
				"g`",
				"g'",
				-- registers
				'"',
				"<c-r>",
				-- spelling
				"z=",
			},
			triggers_blacklist = {
				-- list of mode / prefixes that should never be hooked by WhichKey
				-- this is mostly relevant for keymaps that start with a native binding
				n = { "v" },
				i = { "j", "k" },
				v = { "j", "k" },
			},
			-- disable the WhichKey popup for certain buf types and file types.
			-- Disabled by default for Telescope
			disable = {
				buftypes = {},
				filetypes = {},
			},
		}
		--  ┌────────────────────────────────────────────────────────────────────┐
		--                                 OPTIONS
		--  └────────────────────────────────────────────────────────────────────┘
		local nopts = {
			mode = "n", -- NORMAL mode
			-- prefix: use "<leader>f" for example for mapping everything related to finding files
			-- the prefix is prepended to every mapping part of `mappings`
			prefix = "<leader>",
			buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = false, -- use `nowait` when creating keymaps
			expr = false, -- use `expr` when creating keymaps
		}

		local vopts = {
			mode = "v", -- NORMAL mode
			-- prefix: use "<leader>f" for example for mapping everything related to finding files
			-- the prefix is prepended to every mapping part of `mappings`
			prefix = "<leader>",
			buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = false, -- use `nowait` when creating keymaps
			expr = false, -- use `expr` when creating keymaps
		}
		--  ┌────────────────────────────────────────────────────────────────────┐
		--                                 MAPPINGS
		--  └────────────────────────────────────────────────────────────────────┘
		--  ┌────────────────────────────────────────────────────────────────────┐
		--                               Normal Mode
		--  └────────────────────────────────────────────────────────────────────┘
    -- create a custom function to later use inside a keymapping
    -- local function initiate_ipy()
    --   -- Run the first command
    --   vim.cmd("Lazy load nvim-ipy")
    --
    --   -- Delay for 3 seconds
    --   vim.defer_fn(function()
    --       -- Run the second command after the delay
    --       vim.cmd("RunQtConsole")
    --
    --       -- Delay for 5 seconds
    --       vim.defer_fn(function()
    --           -- Run the third command after the delay
    --           vim.cmd("IPython --existing --no-window")
    --       end, 5000)
    --   end, 3000)
    -- end
		local n_mappings = {
			-- ALPHA
			-- ["a"] = { "<cmd>Alpha<cr>", "Alpha" },

			-- NVIMTREE
			["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },

			["f"] = {
				"<cmd>Telescope find_files<CR>",
				"Find files",
			},
			["F"] = {
				"<cmd>Telescope live_grep<CR>",
				"Find Text",
			},
			["p"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
			["b"] = { "<cmd>Telescope bibtex<cr>", "Telescope BibTeX" },

			-- LAZY
			["L"] = { "<cmd>Lazy<CR>", "Lazy" },

			-- MASON
			["M"] = { "<cmd>Mason<CR>", "Mason" },

			-- LAZYGIT
			["lg"] = { "<cmd>LazyGit<CR>", "LazyGit" },

      -- Outline
      ["o"] = { "<cmd>Outline<CR>", "Toggle Outline" },
			-- TELESCOPE
			-- ["b"] = {
			-- 	"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			-- 	"Buffers",
			-- },

			-- MARKDOWN
			m = {
				name = "Markdown",
				v = { "<cmd>MarkdownPreviewToggle<CR>", "Markdown Preview" },
				h = { "<cmd>MarkdownHeaders<CR>", "Markdown Headers" },
				t = { "<cmd>MDInsertToc<CR>", "Insert TOC" },
			},
      -- NOICE / NOTIFY
      n = {
        name = "Noice",
        l = { "<cmd>Noice last<cr>", "See last message" },
        h = { "<cmd>Telescope notify<cr>", "Message history" },
        a = { "<cmd>Noice all<cr>", "See all messages" },
        d = { "<cmd>Noice dismiss<cr>", "Dismiss all messages" },
        e = { "<cmd>Noice errors<cr>", "See all error messages" },
      },
			-- LSP
			l = {
				name = "LSP",
				a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
				D = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Buffer Diagnostics" },
				d = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Line Diagnostics" },
				w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
				f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format buffer" },
				i = { "<cmd>LspInfo<cr>", "Info" },
				j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
				k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
				l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
				q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
				R = { "<cmd>LspRestart<CR>", "Restart LSP" },
				s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
				S = { "cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
			},
			-- SEARCH
			["?"] = {
				name = "Search",
				c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
				h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
				M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
				r = { "<cmd>SearchBoxReplace confirm=native<cr>", "Search and Replace" },
				R = { "<cmd>Telescope registers<cr>", "Registers" },
				k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
				C = { "<cmd>Telescope commands<cr>", "Commands" },
				s = {
					"<cmd>set spell!<cr>",
					"Spell check",
					-- "<cmd>lua require('telescope.builtin').spell_suggest()"
					-- Add keymaps for spellcheck languages?
				},
				["?"] = { "<cmd>Cheatsheet<CR>", "Cheatsheet" },
			},
			-- REPL COMMANDS (SLIME and IPY)
			s = {
				name = "Slime",
				l = { "<cmd>SlimeSendCurrentLine<CR>", "Send Current Line" },
				-- l = { "<cmd>SlimeSendCurrentLine<CR><Cmd>TmuxNavigatePrevious<CR>", "Send Current Line" },
				b = {
					"<Cmd>normal! Vgg<Plug>SlimeRegionSend<CR>",
					"Send From Beginning to Current Line",
				},
				-- b = {
				-- 	"<Cmd>normal! Vgg<Plug>SlimeRegionSend<CR><Cmd>TmuxNavigatePrevious<CR>",
				-- 	"Send From Beginning to Current Line",
				-- },
				e = {
					"<Cmd>normal! VG<Plug>SlimeRegionSend<CR>",
					"Send From Current Line to End",
				},
				-- e = {
				-- 	"<Cmd>normal! VG<Plug>SlimeRegionSend<CR><Cmd>TmuxNavigatePrevious<CR>",
				-- 	"Send From Current Line to End",
				-- },
				c = { "<Plug>SlimeSendCell<cr>", "Send Cell" },
				-- c = { "<Plug>SlimeSendCell<cr><Cmd>TmuxNavigatePrevious<CR>", "Send Cell" },

				-- name = "Toggle Term Send",
				-- l = { "<cmd>ToggleTermSendCurrentLine<CR>", "Send Current Line" },
				-- b = { "Vgg<cmd>ToggleTermSendVisualLines<CR>''", "Send From Beginning to Current Line" },
				-- e = { "VG<cmd>ToggleTermSendVisualLines<CR>", "Send From Current Line to End" },
			},
			-- r = {
			-- 	name = "IPython",
			-- 	q = { "<cmd>RunQtConsole<CR>", "Run Qt Console" },
			-- 	k = { "<cmd>IPython --existing --no-window<CR>", "Connect kernel" },
   --      c = { "<Plug>(IPy-RunCell)", "Run Cell" },
   --      l = { "<Plug>(IPy-Run)", "Run Line" },
			-- },
      -- ["rn"] = { "<cmd>IncRename ", "Incremental rename" },
			-- C KEY
			c = {
				b = {
					name = "Comment Box",
					l = {
						name = "Left aligned box",
						l = { "<cmd>CBllbox<CR>", "Left aligned text" },
						c = { "<cmd>CBlcbox<CR>", "Center aligned text" },
						r = { "<cmd>CBlrbox<CR>", "Right aligned text" },
					},
					c = {
						name = "Center aligned box",
						l = { "<cmd>CBclbox<CR>", "Left aligned text" },
						c = { "<cmd>CBccbox<CR>", "Center aligned text" },
						r = { "<cmd>CBcrbox<CR>", "Right aligned text" },
					},
					r = {
						name = "Right aligned box",
						l = { "<cmd>CBrlbox<CR>", "Left aligned text" },
						c = { "<cmd>CBrcbox<CR>", "Center aligned text" },
						r = { "<cmd>CBrrbox<CR>", "Right aligned text" },
					},
				},
        -- c = {
        --   name = "Copilot",
        a = { "<cmd>Copilot suggestion<CR>",  "Copilot suggestions (autocomplete)" },
        p = { "<cmd>Copilot panel<CR>", "Copilot panel" },
        s = { "<cmd>Copilot status<CR>", "Copilot status" },
        e = { "<cmd>Copilot enable<CR>", "Copilot enable" },
        d = { "<cmd>Copilot disable<CR>", "Copilot disable" },
        -- },
			},
			-- T KEY
			t = {
				x = {
					name = "VimTeX",
					["c"] = { "<cmd>VimtexCompile<CR>", "VimTeX Compile" },
					["q"] = { "<cmd>VimtexStop<CR>", "VimTeX Stop" },
					["v"] = { "<cmd>VimtexView<CR>", "VimTeX View" },
					["l"] = { "<cmd>VimtexLog<CR>", "VimTeX Log" },
					["i"] = { "<cmd>VimtexInfo<CR>", "VimTeX Info" },
					["e"] = { "<cmd>VimtexErrors<CR>", "VimTeX Errors" },
				},
				["v"] = { "<cmd>ToggleTerm direction=vertical size=55 name=vertical<CR>", "Toggle Term Vertical" },
				["h"] = { "<cmd>ToggleTerm direction=horizontal name=horizontal<CR>", "Toggle Term Horizontal" },
				["t"] = { "<cmd>ToggleTerm direction=float<CR>", "Toggle Term Center" },
			},
			-- JUPYTER
			-- j = {
			--   name = "Jupyter",
			--   ["qt"] = { "<cmd>lua RunQtConsole()<CR>", "Run Qt Console" },
			--   ["c"] = { "[[:<Plug>(IPy-Run)<CR>]]", "Run Current Cell" },
			-- vim.keymap.set('n', '<leader>jqt', [[:lua RunQtConsole()<CR>]], { noremap = true, silent = true })
			-- vim.keymap.set('n', '<leader>jk', [[:IPython --existing --no-window<CR>]], { noremap = true, silent = true })
			-- vim.keymap.set('n', '<leader>jc', [[:<Plug>(IPy-RunCell)]], { noremap = true, silent = true })
			-- vim.keymap.set('n', '<leader>ja', [[:<Plug>(IPy-RunAll)]], { noremap = true, silent = true })
			-- }
			-- QUARTO
			["4"] = {
				name = "Quarto",
				a = { "<cmd>QuartoActivate<CR>", "Quarto Activate" },
				p = { "<cmd>QuartoPreview<CR>", "Quarto Preview" },
				["cp"] = { "<cmd>QuartoClosePreview<CR>", "Quarto Close Preview" },
				h = { "<cmd>QuartoHelp ", "Quarto Help" },
			},
		}
		--  ┌────────────────────────────────────────────────────────────────────┐
		--                               Visual Mode
		--  └────────────────────────────────────────────────────────────────────┘
		local v_mappings = {
			t = {
				name = "Toggle Term",
				s = {
					name = "Toggle Term Send",
					l = { "<cmd>ToggleTermSendVisualLines<CR>", "Send Visual Lines" },
				},
			},
			s = { "<Plug>SlimeRegionSend<CR><Cmd>TmuxNavigatePrevious<CR>", "Send region (slime)" },
			-- r = {
			--   name = "Run Code",
			--   s = { "<cmd>MoltenEvaluateVisual<CR>", "Run visual selection (Molten)" },
			-- },
      r = { "<Plug>(IPy-Run)", "Run Selection" },
		}
		--  ┌────────────────────────────────────────────────────────────────────┐
		--                                  SETUP
		--  └────────────────────────────────────────────────────────────────────┘
		local which_key = require("which-key")

		which_key.setup(setup)
		which_key.register(n_mappings, nopts)
		which_key.register(v_mappings, vopts)
	end,
}
