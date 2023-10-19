return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
      mode = "buffers", -- set to "tabs" to only show tabpages instead
			close_command = ":bd %d", -- can be a string | function, see "Mouse actions"
			right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
			offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
			separator_style = "thin", -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
		},
		highlights = {
			close_button = {
				fg = { attribute = "fg", highlight = "TabLine" },
				bg = { attribute = "bg", highlight = "TabLine" },
			},
		},
	},
}
