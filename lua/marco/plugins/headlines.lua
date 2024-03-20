return {
	"lukas-reineke/headlines.nvim",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = function()
    vim.api.nvim_command('highlight Headline1 guibg=#1e2718')
    vim.api.nvim_command('highlight Headline2 guibg=#21262d')
    vim.api.nvim_command('highlight CodeBlock guibg=#1c1c1c')
    vim.api.nvim_command('highlight Dash guibg=#D19A66 gui=bold')
		local visual = {
			bullets = { "◉", "○", "✸", "✿" },
			codeblock_highlight = "CodeBlock",
			dash_highlight = "Dash",
			dash_string = "-",
			quote_highlight = "Quote",
			quote_string = "┃",
			fat_headlines = true,
			fat_headline_upper_string = "▃",
			fat_headline_lower_string = "▀",
		}
		require("headlines").setup({
			quarto = {
				query = vim.treesitter.query.parse(
					"markdown",
					[[
              (fenced_code_block) @codeblock
          ]]
				),
				codeblock_highlight = "CodeBlock",
				treesitter_language = "markdown",
        visual
			},
			markdown = visual,
			rmd = visual,
      org = visual,
		})
	end,
}
