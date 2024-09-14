return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
		init = function()
			-- Disable automatic setup, we are doing it manually
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},

	{
		"williamboman/mason.nvim",
		lazy = false,
		-- config = true,
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local mason = require("mason")
			local mason_tool_installer = require("mason-tool-installer")

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
			-- Formatters
			mason_tool_installer.setup({
				ensure_installed = {
					"prettier", -- prettier formatter
					"stylua", -- lua formatter
					"isort", -- python formatter
					"black", -- python formatter
					"mdformat",
					"latexindent",
					"bibtex-tidy",
					"eslint_d",
					"clang-format",
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		cmd = { "LspInfo", "LspInstall", "LspStart" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local util = require("lspconfig.util")
			local mason_lspconfig = require("mason-lspconfig")
			local lsp_zero = require("lsp-zero")

			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({
					buffer = bufnr,
					exclude = { "gs" },
				})
			end)

			lsp_zero.set_sign_icons({
				error = " ",
				warn = " ",
				info = " ",
				hint = "󰠠 ",
			})

			mason_lspconfig.setup({

				ensure_installed = {
					"html",
					"cssls",
					"lua_ls",
					"marksman",
					"pyright",
					"texlab",
					"yamlls",
					"ruff",
					"clangd",
				},

				handlers = {

					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,

					pyright = function()
						lspconfig.pyright.setup({
							root_dir = util.root_pattern(
								"pyproject.toml",
								"setup.py",
								"setup.cfg",
								"requirements.txt",
								"Pipfile",
								"pyrightconfig.json",
								".venv"
							),
						})
					end,

					ruff = lsp_zero.noop,

					marksman = function()
						lspconfig.marksman.setup({
							filetypes = { "markdown", "quarto" },
							root_dir = util.root_pattern(".git", ".marksman.toml", "_quarto.yml"),
						})
					end,

					texlab = function()
						lspconfig.texlab.setup({
							filetypes = { "tex", "plaintex", "bib", "rmd", "quarto" },
						})
					end,
					clangd = function()
						lspconfig.clangd.setup({
							filetypes = { "c", "cpp", "objc", "objcpp" },
							init_options = {
								fallbackFlags = { "-I/usr/local/include" },
							},
						})
					end,
				},
			})
		end,
	},
}
