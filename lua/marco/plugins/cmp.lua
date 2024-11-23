return {
	"hrsh7th/nvim-cmp",
	branch = "main",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		-- { "hrsh7th/cmp-emoji" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "ray-x/cmp-treesitter" },
		{ "kdheepak/cmp-latex-symbols" },
		{ "L3MON4D3/LuaSnip" },
		{ "rafamadriz/friendly-snippets" },
		{ "onsails/lspkind-nvim" },
		{ "kawre/neotab.nvim" },
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		-- local neotab = require("neotab")
		lspkind.init()

		-- load vs-code like snippets from plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = {
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-h>"] = cmp.mapping.scroll_docs(-4),
				["<C-l>"] = cmp.mapping.scroll_docs(4),
				["<C-c>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-e>"] = cmp.mapping.abort(),

				-- NEOTAB
				-- ["<Tab>"] = cmp.mapping(function()
				-- 	if cmp.visible() then
				-- 		cmp.select_next_item()
				-- 	elseif luasnip.jumpable(1) then
				-- 		luasnip.jump(1)
				-- 	else
				-- 		neotab.tabout()
				-- 	end
				-- end),
				-- ["<S-Tab>"] = cmp.mapping(function(fallback)
				-- 	if cmp.visible() then
				-- 		cmp.select_prev_item()
				-- 	else
				-- 		fallback()
				-- 	end
				-- end, { "i", "s" }),
			},
			autocomplete = false,
			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = function(entry, vim_item)
					local menu
					local kind
					local icons = {
						Copilot = "",
						otter = "[🦦]",
						nvim_lsp = "[]",
						luasnip = "[󰢱]",
						buffer = "[󰹑]",
						path = "[]",
						tags = "[󰏢]",
						treesitter = "[]",
						latex_symbols = "[]",
						emoji = "[󰱨]",
					}

					if require("lspkind").symbol_map[vim_item.kind] and vim_item.kind then
						kind = require("lspkind").symbol_map[vim_item.kind] .. " " .. vim_item.kind
					else
						kind = vim_item.kind
					end

					if entry.source.name == "nvim_lsp" and entry.source.source.client.name then
						menu = icons[entry.source.name] .. " " .. entry.source.source.client.name
					else
						menu = icons[entry.source.name] or entry.source.name
					end

					vim_item.kind = kind
					vim_item.menu = menu
					return vim_item
				end,
			},
			sources = {
				{ name = "copilot" },
				{ name = "otter" }, -- for code chunks in quarto
				{
					name = "path",
					option = {
						get_cwd = function()
							return vim.fn.getcwd()
						end,
					},
				},
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				-- { name = "buffer" },
				-- { name = "treesitter" },
				{ name = "latex_symbols" },
				-- { name = "emoji" },
			},
		})

		-- Load friendly snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		-- link quarto and rmarkdown to markdown snippets
		luasnip.filetype_extend("quarto", { "markdown" })
		luasnip.filetype_extend("rmarkdown", { "markdown" })
	end,
}
