return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"onsails/lspkind.nvim",
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
    "kawre/neotab.nvim",
	},

	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")

    local neotab = require("neotab")

		local lspkind = require("lspkind")

		local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		-- load vs-code like snippets from plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<Tab>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            neotab.tabout()
          end
        end),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "otter" }, -- otter
				{ name = "nvim_lsp" }, -- lsp
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),
			-- configure lspkind for vs-code like icons
			formatting = {
				-- format = lspkind.cmp_format({
				-- 	maxwidth = 50,
				-- 	ellipsis_char = "...",
				-- 	menu = {
				-- 		otter = "[🦦]",
				-- 		copilot = "[]",
				-- 		luasnip = "[snip]",
				-- 		nvim_lsp = "[LSP]",
				-- 		buffer = "[buf]",
				-- 		path = "[path]",
				-- 		spell = "[spell]",
				-- 		pandoc_references = "[ref]",
				-- 		tags = "[tag]",
				-- 		treesitter = "[TS]",
				-- 		calc = "[calc]",
				-- 		latex_symbols = "[tex]",
				-- 		emoji = "[emoji]",
				-- 	},
				-- }),
        -- Format function
				format = function(entry, vim_item)
					local icons = {
						otter = "[🦦]",
						copilot = "[]",
						luasnip = "[snip]",
						nvim_lsp = "[LSP]",
						buffer = "[buf]",
						path = "[path]",
						spell = "[spell]",
						pandoc_references = "[ref]",
						tags = "[tag]",
						treesitter = "[TS]",
						calc = "[calc]",
						latex_symbols = "[tex]",
						emoji = "[emoji]",
					}

					-- If the entry is from the LSP source, add the LSP server information if available
					if entry.source.name == "nvim_lsp" then
						vim_item.menu =
							string.format("%s %s", icons[entry.source.name], entry.source.source.client.name)
					else
						vim_item.menu = icons[entry.source.name]
					end

					return vim_item
        end
			},
		})
	end,
}
