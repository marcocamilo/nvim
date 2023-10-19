local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

opt.backup = false -- creates a backup file
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.cursorline = true -- highlight the current line
opt.expandtab = true -- convert tabs to spaces
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.fillchars.eob = " " -- show empty lines at the end of a buffer as ` ` {default `~`}
opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
opt.helpheight = 15
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = true -- ignore case in search patterns
opt.laststatus = 3 -- only the last window will always have a status line
opt.linebreak = true -- Wrap on word boundary
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.number = true -- set numbered lines
opt.relativenumber = true -- set relative numbers
opt.numberwidth = 4 -- minimal number of columns to use for the line number {default 4}
opt.pumheight = 10 -- pop up menu height
opt.report = 0 -- print message from commands
opt.ruler = false -- hide the line and column number of the cursor position
opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor
opt.sidescrolloff = 8 -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.showcmd = false -- hide (partial) command in the last line of the screen (for performance)
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 0 -- always show tabs
opt.smartcase = true -- smart case
opt.smartindent = true -- make indenting smarter again
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.swapfile = false -- creates a swapfile
opt.tabstop = 2 -- insert 2 spaces for a tab
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true -- enable persistent undo
opt.updatetime = 300 -- faster completion (4000ms default)
opt.winheight = 20
opt.wrap = true -- display lines as one long line
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

opt.shortmess:append("c") -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
opt.whichwrap:append("<,>,[,],h,l") -- keys allowed to move to the previous/next line when the beginning/end of line is reached
opt.iskeyword:append("-") -- treats words with `-` as single words
opt.formatoptions:remove({ "c", "r", "o" }) -- This is a sequence of letters which describes how automatic formatting is to be done

opt.backspace = "indent,eol,start"
