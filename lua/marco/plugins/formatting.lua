return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
        cpp = { "clang-format" },
				javascript = { "prettier" },
				bib = { "bibtex-tidy" },
				css = { "prettier" },
				graphql = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				markdown = { "mdformat" },
				python = { "isort", "black", "ruff" },
				latex = { "latexindent" },
				yaml = { "prettier" },
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 5000,
			})
		end, { desc = "Make pretty with formatter" })
	end,
}
