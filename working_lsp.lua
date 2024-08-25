return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },

  -- Autocompletion
  {
	"hrsh7th/nvim-cmp",
	branch = "main",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-calc" },
		{ "hrsh7th/cmp-emoji" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "f3fora/cmp-spell" },
		{ "ray-x/cmp-treesitter" },
		{ "kdheepak/cmp-latex-symbols" },
		{ "jmbuhr/cmp-pandoc-references" },
		{ "L3MON4D3/LuaSnip" },
		{ "rafamadriz/friendly-snippets" },
		{ "onsails/lspkind-nvim" },
		{ "kawre/neotab.nvim" },
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		local neotab = require("neotab")
		lspkind.init()

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
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = {
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-x>"] = cmp.mapping.abort(),

				-- TABS Original
				-- ["<Tab>"] = cmp.mapping(function(fallback)
				--   if cmp.visible() then
				--     cmp.select_next_item()
				--   elseif has_words_before() then
				--     cmp.complete()
				--   else
				--     fallback()
				--   end
				-- end, { "i", "s" }),
				-- ["<S-Tab>"] = cmp.mapping(function(fallback)
				--   if cmp.visible() then
				--     cmp.select_prev_item()
				--   else
				--     fallback()
				--   end
				-- end, { "i", "s" }),

				-- NEOTAB
				["<Tab>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.select_next_item()
          elseif luasnip.jumpable(1) then
						luasnip.jump(1)
          else
						neotab.tabout()
					end
				end),
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
				-- CONFIG 1: SOURCE NAME
				-- format = function(entry, vim_item)
				-- 	local icons = {
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
				-- 	}
				-- 	if entry.source.name == "nvim_lsp" then
				-- 		vim_item.menu =
				-- 			string.format("%s %s", icons[entry.source.name], entry.source.source.client.name)
				-- 	else
				-- 		vim_item.menu = icons[entry.source.name]
				-- 	end
				-- 	return vim_item
				-- end,
				-- CONFIG 2: ORIGINAL
				-- format = lspkind.cmp_format({
				--        mode = "text_symbol",
				-- 	menu = {
				-- 		otter = "[🦦]",
				-- 		nvim_lsp = "[LSP]",
				-- 		luasnip = "[snip]",
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
				-- CONFIG 3: devcons
				-- format = function(entry, vim_item)
				--   if vim.tbl_contains({ 'path' }, entry.source.name) then
				--     local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
				--     if icon then
				--       vim_item.kind = icon
				--       vim_item.kind_hl_group = hl_group
				--       return vim_item
				--     end
				--   end
				--   return require('lspkind').cmp_format({ with_text = false })(entry, vim_item)
				-- end
				-- CONFIG 5: custom
				fields = { "abbr", "kind", "menu" },
				format = function(entry, vim_item)
					local menu
					local kind
					local icons = {
						Copilot = "",
						otter = "[🦦]",
						nvim_lsp = "[LSP]",
						luasnip = "[snip]",
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
				{ name = "path" },
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "luasnip" },
				{ name = "pandoc_references" },
				{ name = "buffer" },
				{ name = "spell" },
				{ name = "treesitter" },
				{ name = "calc" },
				{ name = "latex_symbols" },
				{ name = "emoji" },
			},
		})

		-- for friendly snippets
		require("luasnip.loaders.from_vscode").lazy_load()
		-- for custom snippets
		require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snips" } })
		-- link quarto and rmarkdown to markdown snippets
		luasnip.filetype_extend("quarto", { "markdown" })
		luasnip.filetype_extend("rmarkdown", { "markdown" })
	end,
},

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      -- if you want to know more about mason.nvim
      -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      require('mason-lspconfig').setup({
        ensure_installed = {
          "pyright",
          "tsserver",
        },
        handlers = {
          -- this first function is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,

          -- this is the "custom handler" for `lua_ls`
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        }
      })
    end
  }
}


