return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
    ------------------------------------
    -- SETUP
    ------------------------------------
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
          operators = true, -- adds help for operators like d, y, ...
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
        scroll_down = "<c-j>", -- binding to scroll down inside the popup
        scroll_up = "<c-k>", -- binding to scroll up inside the popup
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
    ------------------------------------
    -- OPTIONS
    ------------------------------------
		local opts = {
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
    ------------------------------------
    -- MAPPINGS
    ------------------------------------
		local mappings = {
      ------------------
      -- PLUGINS
      ------------------
      -- Alpha
			["a"] = { "<cmd>Alpha<cr>", "Alpha" },

      -- NvimTree
      ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },

      -- Telescope
			["b"] = {
				"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
				"Buffers",
			},
			["f"] = {
				-- "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        ":Telescope find_files<CR>",
				"Find files",
			},
			["F"] = {
        -- "<cmd>Telescope live_grep theme=ivy<cr> 
        ":Telescope live_grep<CR>",
        "Find Text"
      },
			["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },

      -- Markdown Preview
      ["mv"] = { ":MarkdownPreviewToggle<CR>", "Markdown Preview" },

      -- VimTeX
      ["txc"] = { ":VimtexCompile<CR>", "VimTeX Compile" },
      ["txv"] = { ":VimtexView<CR>", "VimTeX View" },

      -- Lazy
      ["L"] = { ":Lazy<CR>", "Lazy" },

      -- Mason
      ["M"] = { ":Mason<CR>", "Mason"},

      ------------------
      -- MAPPINGS
      ------------------
			l = {
				name = "LSP",
				a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
				d = {
					"<cmd>Telescope diagnostics bufnr=0<cr>",
					"Document Diagnostics",
				},
				w = {
					"<cmd>Telescope diagnostics<cr>",
					"Workspace Diagnostics",
				},
				f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
				i = { "<cmd>LspInfo<cr>", "Info" },
				-- I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
				j = {
					"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
					"Next Diagnostic",
				},
				k = {
					"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
					"Prev Diagnostic",
				},
				l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
				q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
				r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
				s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
				S = {
					"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
					"Workspace Symbols",
				},
			},
			s = {
				name = "Search",
				c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
				h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
				M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
				r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
				R = { "<cmd>Telescope registers<cr>", "Registers" },
				k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
				C = { "<cmd>Telescope commands<cr>", "Commands" },
			},

			-- q = {
			-- 	name = "Quarto",
			-- 	a = { ":QuartoActivate<cr>", "activate" },
			-- 	p = { ":lua require'quarto'.quartoPreview()<cr>", "preview" },
			-- 	q = { ":lua require'quarto'.quartoClosePreview()<cr>", "close" },
			-- 	h = { ":QuartoHelp ", "help" },
			-- 	r = {
			-- 		name = "run",
			-- 		r = { ":QuartoSendAbove<cr>", "to cursor" },
			-- 		a = { ":QuartoSendAll<cr>", "all" },
			-- 	},
			-- 	e = { ":lua require'otter'.export()<cr>", "export" },
			-- 	E = { ":lua require'otter'.export(true)<cr>", "export overwrite" },
			-- 	c = {
			-- 		name = "chunks",
			-- 		p = { "o```{python}<cr>```<esc>O", "python code chunk" },
			-- 		r = { "o```{r}<cr>```<esc>O", "r code chunk" },
			-- 		t = { "o```{=tex}<cr>```<esc>O", "python code chunk" },
			-- 	},
			-- },
		}

		local which_key = require("which-key")

		which_key.setup(setup)
		which_key.register(mappings, opts)
	end,
}

