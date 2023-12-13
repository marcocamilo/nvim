return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				-- typescript = { "prettier" },
				-- javascriptreact = { "prettier" },
				-- typescriptreact = { "prettier" },
				-- svelte = { "prettier" },
				bib = { "bibtex-tidy" },
				css = { "prettier" },
				graphql = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				markdown = { "mdformat" },
				python = { "isort", "black" },
				latex = { "latexindent" },
				yaml = { "prettier" },
			},
			-- format_on_save = {
			-- 	lsp_fallback = true,
			-- 	async = false,
			-- 	timeout_ms = 500,
			-- },
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 2500,
			})
		end, { desc = "Make pretty with formatter" })
	end,
}
