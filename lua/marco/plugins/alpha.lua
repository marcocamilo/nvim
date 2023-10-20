return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			[[ ███    ███  █████  ██████   ██████  ██████      ██    ██ ██ ███    ███ ]],
			[[ ████  ████ ██   ██ ██   ██ ██      ██    ██     ██    ██ ██ ████  ████ ]],
			[[ ██ ████ ██ ███████ ██████  ██      ██    ██     ██    ██ ██ ██ ████ ██ ]],
			[[ ██  ██  ██ ██   ██ ██   ██ ██      ██    ██      ██  ██  ██ ██  ██  ██ ]],
			[[ ██      ██ ██   ██ ██   ██  ██████  ██████        ████   ██ ██      ██ ]],
		}

		-- Set menu
		dashboard.section.buttons.val = {
      dashboard.button("n", " " .. " New file",        "<cmd> ene <BAR> startinsert <cr>"),
      dashboard.button("f", " " .. " Find file",       "<cmd> Telescope find_files <cr>"),
      dashboard.button("r", " " .. " Recent files",    "<cmd> Telescope oldfiles <cr>"),
      dashboard.button("t", " " .. " Find text",       "<cmd> Telescope live_grep <cr>"),
      dashboard.button("c", " " .. " Config",          ":e $MYVIMRC  <cr>"),
      dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
      dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "⚡ Neovim loaded "
          .. stats.loaded
          .. "/"
          .. stats.count
          .. " plugins in "
          .. ms
          .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
