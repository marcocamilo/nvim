return {
	"lukas-reineke/headlines.nvim",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = function()
		-- Define custom highlight groups using Vimscript
		-- vim.api.nvim_command('highlight Headline1 guibg=#1e2718')
		-- vim.api.nvim_command('highlight Headline2 guibg=#21262d')
		-- vim.cmd([[highlight Headline1 guibg=#0c004c guifg=white]])
		-- vim.cmd([[highlight Headline2 guibg=#295715 guifg=white]])
		-- vim.cmd([[highlight Headline3 guibg=#8d8200 guifg=white]])
		-- vim.cmd([[highlight Headline4 guibg=#a56106 guifg=white]])
		-- vim.cmd([[highlight Headline5 guibg=#7e0000 guifg=white]])
		-- vim.cmd([[highlight Headline6 guibg=#560b7b guifg=white]])
		-- Defines the codeblock background color to something darker
		vim.api.nvim_command("highlight CodeBlock guibg=#1c1c1c")
		-- Defines the dash line (---) color
		-- vim.api.nvim_command("highlight Dash guibg=#D19A66 gui=bold")

		local styling = {
			query = vim.treesitter.query.parse(
				"markdown",
				[[
              (fenced_code_block) @codeblock
          ]]
			),
			codeblock_highlight = "CodeBlock",
			treesitter_language = "markdown",
			-- If set to false, headlines will be a single line and there will be no
			-- "fat_headline_upper_string" and no "fat_headline_lower_string"
			fat_headlines = true,
			--
			-- Lines added above and below the header line makes it look thicker
			-- "lower half block" unicode symbol hex:2584
			-- "upper half block" unicode symbol hex:2580
			fat_headline_upper_string = "▄",
			fat_headline_lower_string = "▀",
			--
			-- You could add a full block if you really like it thick ;)
			-- fat_headline_upper_string = "█",
			-- fat_headline_lower_string = "█",
			--
			-- Other set of lower and upper symbols to try
			-- fat_headline_upper_string = "▃",
			-- fat_headline_lower_string = "-",
			--
			headline_highlights = {
				"Headline1",
				"Headline2",
				"Headline3",
				"Headline4",
				"Headline5",
				"Headline6",
			},
		}
		-- Setup headlines.nvim with the newly defined highlight groups
		require("headlines").setup({
			markdown = styling,
			quarto = styling,
		})

		-- Custom header configuration
		-- local visual = {
		-- 	bullets = { "◉", "○", "✸", "✿" },
		-- 	codeblock_highlight = "CodeBlock",
		-- 	dash_highlight = "Dash",
		-- 	dash_string = "-",
		-- 	quote_highlight = "Quote",
		-- 	quote_string = "┃",
		-- 	fat_headlines = true,
		-- 	fat_headline_upper_string = "▃",
		-- 	fat_headline_lower_string = "▀",
		-- }
		-- require("headlines").setup({
		-- 	quarto = {
		-- 		query = vim.treesitter.query.parse(
		-- 			"markdown",
		-- 			[[
		--             (fenced_code_block) @codeblock
		--         ]]
		-- 		),
		-- 		codeblock_highlight = "CodeBlock",
		-- 		treesitter_language = "markdown",
		-- 		visual,
		-- 	},
		-- 	markdown = visual,
		-- 	rmd = visual,
		-- 	org = visual,
		-- })
	end,
}
