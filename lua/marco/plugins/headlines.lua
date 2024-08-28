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

		-- Define styling for headlines and other elements
		local styling = {
			query = vim.treesitter.query.parse(
				"markdown",
				[[
            (atx_heading [
                (atx_h1_marker)
                (atx_h2_marker)
                (atx_h3_marker)
                (atx_h4_marker)
                (atx_h5_marker)
                (atx_h6_marker)
            ] @headline)

            (fenced_code_block) @codeblock

            (block_quote_marker) @quote
            (block_quote (paragraph (inline (block_continuation) @quote)))
            (block_quote (paragraph (block_continuation) @quote))
            (block_quote (block_continuation) @quote)
        ]]
			),
			bullet_highlights = {
				"@text.title.1.marker.markdown",
				"@text.title.2.marker.markdown",
				"@text.title.3.marker.markdown",
				"@text.title.4.marker.markdown",
				"@text.title.5.marker.markdown",
				"@text.title.6.marker.markdown",
			},
			treesitter_language = "markdown",
			bullets = { "◉", "○", "✸", "✿" },
			codeblock_highlight = "CodeBlock",
			dash_highlight = "Dash",
			dash_string = "-",
			quote_highlight = "Quote",
			quote_string = "┃",
			fat_headlines = true,
			fat_headline_upper_string = "▄",
			fat_headline_lower_string = "▀",
      -- headline_indent = false,
			headline_highlights = {
				"Headline1",
				"Headline2",
				"Headline3",
				"Headline4",
				"Headline5",
				"Headline6",
			},
		}

		-- Setup headlines.nvim with the defined styling
		require("headlines").setup({
			markdown = styling,
			quarto = styling,
		})
	end,
}
