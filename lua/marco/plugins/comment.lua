return {
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
	{
		"LudoPinelli/comment-box.nvim",
		opts = {
			doc_width = 80, -- Width of the document
			box_width = 70, -- Width of the boxes
			borders = { -- Symbols used to draw a box
				top = "─",
				bottom = "─",
				left = " ",
				right = " ",
				top_left = "┌",
				top_right = "┐",
				bottom_left = "└",
				bottom_right = "┘",
			},
			line_width = 70, -- Width of the lines
			line = { -- Symbols used to draw a line
				line = "─",
				line_start = "─",
				line_end = "─",
			},
			outer_blank_lines = false, -- Insert a blank line above and below the box
			inner_blank_lines = false, -- Insert a blank line above and below the text
			line_blank_line_above = false, -- Insert a blank line above the line
			line_blank_line_below = false, -- Insert a blank line below the line
		},
	},
}
