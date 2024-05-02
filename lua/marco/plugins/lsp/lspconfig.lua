return {
	"neovim/nvim-lspconfig",
	tag = nil,
	version = nil,
	branch = "master",
	event = "BufReadPre",
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim" },
		{ "williamboman/mason.nvim" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "folke/neodev.nvim", opt = {} },
		{ "microsoft/python-type-stubs", cond = false },
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			automatic_installation = true,
		})

		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local util = require("lspconfig.util")

		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Show LSP references"
			keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			client.server_capabilities.document_formatting = true
		end

		local on_attach_qmd = function(client, bufnr)
			local function buf_set_keymap(...)
				vim.api.nvim_buf_set_keymap(bufnr, ...)
			end
			local function buf_set_option(...)
				vim.api.nvim_buf_set_option(bufnr, ...)
			end

			buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
			local opts = { noremap = true, silent = true }

			opts.desc = "Show LSP implementations"
			buf_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Go to previous diagnostic"
			buf_set_keymap("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			buf_set_keymap("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			client.server_capabilities.document_formatting = true
		end

		local lsp_flags = {
			allow_incremental_sync = true,
			debounce_text_changes = 150,
		}

		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
		})
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
			vim.lsp.handlers.hover,
			{ border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } }
		)
		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
			vim.lsp.handlers.signature_help,
			{ border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } }
		)

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		-- See https://github.com/neovim/neovim/issues/23291
		if capabilities.workspace == nil then
			capabilities.workspace = {}
			capabilities.workspace.didChangeWatchedFiles = {}
		end
		capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

		-- also needs:
		-- $home/.config/marksman/config.toml :
		-- [core]
		-- markdown.file_extensions = ["md", "markdown", "qmd"]
		lspconfig.marksman.setup({
			on_attach = on_attach_qmd,
			capabilities = capabilities,
			filetypes = { "markdown", "quarto" },
			root_dir = util.root_pattern(".git", ".marksman.toml", "_quarto.yml"),
		})

		-- -- another optional language server for grammar and spelling
		-- -- <https://github.com/valentjn/ltex-ls>
		-- lspconfig.ltex.setup {
		--   on_attach = on_attach_qmd,
		--   capabilities = capabilities,
		--   filetypes = { "markdown", "tex", "quarto" },
		-- }
		-- LaTeX
		lspconfig["ltex"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "markdown", "tex", "quarto" },
		})
		lspconfig["texlab"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "tex", "plaintex", "bib", "rmd", "quarto" },
		})

		lspconfig.r_language_server.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			flags = lsp_flags,
			settings = {
				r = {
					lsp = {
						rich_documentation = false,
					},
				},
			},
		})

		lspconfig.cssls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			flags = lsp_flags,
		})

		lspconfig.html.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			flags = lsp_flags,
		})

		-- lspconfig.emmet_language_server.setup({
		-- 	on_attach = on_attach,
		-- 	capabilities = capabilities,
		-- 	flags = lsp_flags,
		-- })

		lspconfig.yamlls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			flags = lsp_flags,
			settings = {
				yaml = {
					schemaStore = {
						enable = true,
						url = "",
					},
				},
			},
		})

		-- lspconfig.dotls.setup({
		-- 	on_attach = on_attach,
		-- 	capabilities = capabilities,
		-- 	flags = lsp_flags,
		-- })

		local function strsplit(s, delimiter)
			local result = {}
			for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
				table.insert(result, match)
			end
			return result
		end

		local function get_quarto_resource_path()
			local f = assert(io.popen("quarto --paths", "r"))
			local s = assert(f:read("*a"))
			f:close()
			return strsplit(s, "\n")[2]
		end

		local lua_library_files = vim.api.nvim_get_runtime_file("", true)
		local lua_plugin_paths = {}
		local resource_path = get_quarto_resource_path()
		if resource_path == nil then
			vim.notify_once("quarto not found, lua library files not loaded")
		else
			table.insert(lua_library_files, resource_path .. "/lua-types")
			table.insert(lua_plugin_paths, resource_path .. "/lua-plugin/plugin.lua")
		end

		-- not upadated yet in automatic mason-lspconfig install,
		-- open mason manually with `<space>vm` and `/` search for lua.
		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			flags = lsp_flags,
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
					runtime = {
						version = "LuaJIT",
						plugin = lua_plugin_paths,
					},
					diagnostics = {
						globals = { "vim", "quarto", "pandoc", "io", "string", "print", "require", "table" },
						disable = { "trailing-space" },
					},
					workspace = {
						library = lua_library_files,
						checkThirdParty = false,
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})

		-- See https://github.com/neovim/neovim/issues/23291
		-- disable lsp watcher.
		-- Too slow on linux for
		-- python projects
		-- where pyright and nvim both create many watchers otherwise
		-- if it is not fixed by
		-- capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false
		-- up top
		-- local ok, wf = pcall(require, "vim.lsp._watchfiles")
		-- if ok then
		--   wf._watchfunc = function()
		--     return function() end
		--   end
		-- end

		lspconfig.pyright.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			flags = lsp_flags,
			settings = {
				python = {
					stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs",
					analysis = {
						autoSearchPaths = true,
						useLibraryCodeForTypes = false,
						diagnosticMode = "openFilesOnly",
					},
				},
			},
			root_dir = function(fname)
				return util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt")(fname)
					or util.path.dirname(fname)
			end,
		})

		-- lspconfig.jedi_language_server.setup({
		--   on_attach = on_attach,
		--   capabilities = capabilities,
		--   flags = lsp_flags,
		--   settings = {
		--   },
		--   root_dir = function(fname)
		--     return util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt")(
		--       fname
		--     ) or util.path.dirname(fname)
		--   end,
		-- })

		-- to install pylsp plugins run:
		-- cd ~/.local/share/nvim/mason/packages/python-lsp-server
		-- source venv/bin/activate
		-- pip install mypy
		-- pip install rope
		-- pip install pylsp-rope
		-- pip install python-lsp-black
		-- pip install pylsp-mypy
		--
		-- lspconfig.pylsp.setup({
		--   on_attach = on_attach,
		--   capabilities = capabilities,
		--   flags = lsp_flags,
		--   settings = {
		--     pylsp = {
		--       configurationSources = {
		--       },
		--       plugins = {
		--         pycodestyle = {
		--           ignore = {
		--             'W391',
		--             'W292', -- no blank line after file
		--             'E303', -- blank lines in otter document
		--             'E302', -- blank lines in otter document
		--             'E305', -- blank lines in otter document
		--             'E111', -- indentation is not a multiple of four
		--             'E265', -- magic comments
		--             'E402', -- imports not at top
		--             'E741', -- ambiguous variable name
		--           },
		--           maxLineLength = 120
		--         },
		--         black = {
		--           enabled = true
		--         },
		--         mypy = {
		--           enabled = true,
		--           dmypy = true,
		--           live_mode = false,
		--         },
		--         rope = {
		--
		--         },
		--       }
		--     }
		--   },
		--   root_dir = function(fname)
		--     return util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt")(
		--       fname
		--     ) or util.path.dirname(fname)
		--   end,
		-- })

		lspconfig.julials.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			flags = lsp_flags,
		})

		lspconfig.bashls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			flags = lsp_flags,
			filetypes = { "sh", "bash" },
		})

		-- Add additional languages here.
		-- See `:h lspconfig-all` for the configuration.
		-- Like e.g. Haskell:
		-- lspconfig.hls.setup {
		--   on_attach = on_attach,
		--   capabilities = capabilities,
		--   flags = lsp_flags
		-- }

		-- lspconfig.rust_analyzer.setup{
		--   on_attach = on_attach,
		--   capabilities = capabilities,
		--   settings = {
		--     ['rust-analyzer'] = {
		--       diagnostics = {
		--         enable = false;
		--       }
		--     }
		--   }
		-- }
	end,
}
