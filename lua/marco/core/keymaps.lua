-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

------------------------------------------------
-- EDITING KEYS --------------------------------
------------------------------------------------
-- Better paste
keymap("v", "p", '"_dP', opts)

-- Better cut
keymap("n", "x", "d", opts)
keymap("n", "X", "D", opts)

-- Better delete
keymap("n", "d", '"_d', opts)
keymap("n", "D", '"_D', opts)
keymap("v", "d", '"_d', opts)

-- Better change
keymap("n", "c", '"_c', opts)
keymap("v", "c", '"_c', opts)

-- Move
keymap("n", "<S-k>", ":MoveLine(-1)<CR>", opts)
keymap("n", "<S-j>", ":MoveLine(1)<CR>", opts)
keymap("n", "<C-.>", ":MoveWord(1)<CR>", opts)
keymap("n", "<C-,>", ":MoveWord-(1)<CR>", opts)
-- keymap("n", "<C-H>", ":MoveHChar(-1)<CR>", opts)
-- keymap("n", "<C-L>", ":MoveHChar(1)<CR>", opts)

keymap("v", "<S-j>", ":MoveBlock(1)<CR>", opts)
keymap("v", "<S-k>", ":MoveBlock(-1)<CR>", opts)
keymap("v", "<C-h>", ":MoveHBlock(-1)<CR>", opts)
keymap("v", "<C-l>", ":MoveHBlock(1)<CR>", opts)

------------------------------------------------
-- BUFFERS, WINDOWS AND TABS -------------------
------------------------------------------------
-- Buffer Navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-q>", ":bd<CR>", opts) -- close buffers

-- Window Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Window Management
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Tab Management
keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

------------------------------------------------
-- MODES ---------------------------------------
------------------------------------------------
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

------------------------------------------------
-- NORMAL --------------------------------------
------------------------------------------------
--
keymap("n", "<leader>w", ":w<CR>", opts)

-- Write and quit
keymap("n", "<leader>W", ":wq<CR>", opts)

-- Quit
keymap("n", "<leader>Q", ":q<CR>", opts)

-- Alpha (return to homescreen)
keymap("n", "<leader>;", ":Alpha<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

------------------------------------------------
-- Insert --------------------------------------
------------------------------------------------
-- Quickly exit insert mode
keymap("i", "jk", "<ESC>", opts)

------------------------------------------------
-- Visual --------------------------------------
------------------------------------------------
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

------------------------------------------------
-- Plugins--------------------------------------
------------------------------------------------
-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
-- keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
-- keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
-- keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
-- keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
-- keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- DAP
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
-- keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Lsp
-- keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-- Markdown Preview
keymap("n", "<leader>mv", ":MarkdownPreviewToggle<CR>", opts)

-- VimTeX
keymap("n", "<leader>txc", ":VimtexCompile<CR>", opts)
keymap("n", "<leader>txv", ":VimtexView<CR>", opts)

-- LF
keymap("n", "lf", ":Lf<CR>", opts)

-- Quarto
keymap("n", "<leader>qp", ":QuartoPreview", opts)

-- Lazy
keymap("n", "<leader>L", ":Lazy<CR>", opts)

-- Mason
keymap("n", "<leader>M", ":Mason<CR>", opts)

-- Markdown Headers
keymap("n", "<leader>mh", ":MarkdownHeaders<CR>", opts)
