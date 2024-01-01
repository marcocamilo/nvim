return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"jose-elias-alvarez/typescript.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{
			"smjonas/inc-rename.nvim",
			config = true,
		},
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		-- enable keybinds only for when lsp server available
		local on_attach = function(client, bufnr)
			-- keybind options
			local opts = { noremap = true, silent = true, buffer = bufnr }

			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			-- opts.desc = "Smart rename"
			-- keymap.set("n", "<leader>rn", ":IncRename ", opts) -- smart rename

			-- opts.desc = "Buffer diagnostics"
			-- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			-- opts.desc = "Line diagnostics"
			-- keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Documentation for object under cursor"
			keymap.set("n", "<leader>sd", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			-- opts.desc = "Restart LSP"
			-- keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local lsp_flags = {
			allow_incremental_sync = true,
			debounce_text_changes = 150,
		}

		-- LSP CONFIGS

		-- python
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			flags = lsp_flags,
		})
		lspconfig["pylsp"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			flags = lsp_flags,
		})
		lspconfig["jedi_language_server"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			flags = lsp_flags,
		})

		-- LaTeX
		lspconfig["ltex"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		lspconfig["texlab"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "tex", "plaintex", "bib", "rmd", "quarto" },
		})

		-- Markdown
		lspconfig["marksman"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "markdown", "quarto" },
		})

		-- R-Markdown
		lspconfig["r_language_server"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			flags = lsp_flags,
			settings = {
				r = {
					lsp = {
						rich_documentation = false,
					},
				},
			},
		})

		-- Yaml
		lspconfig["yamlls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			flags = lsp_flags,
		})

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "markdown", "html" },
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
