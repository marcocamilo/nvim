return {
	-- dashboard to greet
	{
		"goolord/alpha-nvim",
    event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			-- Set header
			dashboard.section.header.val = {
        [[  ███╗   ███╗ █████╗ ██████╗  ██████╗ ██████╗     ███╗   ██╗██╗███╗   ███╗  ]],
        [[  ████╗ ████║██╔══██╗██╔══██╗██╔════╝██╔═══██╗    ████╗  ██║██║████╗ ████║  ]],
        [[  ██╔████╔██║███████║██████╔╝██║     ██║   ██║    ██╔██╗ ██║██║██╔████╔██║  ]],
        [[  ██║╚██╔╝██║██╔══██║██╔══██╗██║     ██║   ██║    ██║╚██╗██║██║██║╚██╔╝██║  ]],
        [[  ██║ ╚═╝ ██║██║  ██║██║  ██║╚██████╗╚██████╔╝    ██║ ╚████║██║██║ ╚═╝ ██║  ]],
        [[  ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝     ╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝  ]],
      }

			-- Set menu
			dashboard.section.buttons.val = {
		      dashboard.button("n", " " .. " New file",        "<cmd> ene <BAR> startinsert <cr>"),
          dashboard.button("f", "󰈞 " .. " Find file",       "<cmd> Telescope find_files <cr>"),
          dashboard.button("r", " " .. " Recent files",    "<cmd> Telescope oldfiles <cr>"),
          dashboard.button("t", " " .. " Find text",       "<cmd> Telescope live_grep <cr>"),
          dashboard.button("c", " " .. " Config",          ":e $MYVIMRC  <cr>"),
          dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
          dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
			}

			local fortune = require("alpha.fortune")
      dashboard.section.footer.val = fortune({
        fortune_list = {
          { "You otter be proud of yourself!", "", "— 🦦" },
          { "Hello from the otter slide!", "", "— 🦦" },
          { "To otter space!", "", "— 🦦" },
          { "What if I say I'm not like the otters?", "", "— Foo Fighters" },
        },
      })

			-- Send config to alpha
			alpha.setup(dashboard.opts)
		end,
	},
}
