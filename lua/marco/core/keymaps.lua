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
keymap("v", "d", '"_d', opts)
keymap("n", "D", '"_D', opts)
keymap("n", "<Del>", '"_x', opts)

-- Better change
keymap("n", "c", '"_c', opts)
keymap("v", "c", '"_c', opts)

-- Move
keymap("n", "<S-k>", "<cmd>MoveLine(-1)<CR>", opts)
keymap("n", "<S-j>", "<cmd>MoveLine(1)<CR>", opts)
keymap("n", "<C-.>", "<cmd>MoveWord(1)<CR>", opts)
keymap("n", "<C-,>", "<cmd>MoveWord-(1)<CR>", opts)
-- keymap("n", "<C-H>", "<cmd>MoveHChar(-1)<CR>", opts)
-- keymap("n", "<C-L>", "<cmd>MoveHChar(1)<CR>", opts)

keymap("v", "<S-j>", "<cmd>MoveBlock(1)<CR>", opts)
keymap("v", "<S-k>", "<cmd>MoveBlock(-1)<CR>", opts)
keymap("v", "<C-h>", "<cmd>MoveHBlock(-1)<CR>", opts)
keymap("v", "<C-l>", "<cmd>MoveHBlock(1)<CR>", opts)

-- Control Indentation
keymap("n", "<", "<<", { desc = "Indent left" }, opts)
keymap("n", ">", ">>", { desc = "Indent right" }, opts)
keymap("v", "<", "<gv", { desc = "Indent left" }, opts)
keymap("v", ">", ">gv", { desc = "Indent right" }, opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

------------------------------------------------
-- BUFFERS, WINDOWS AND TABS -------------------
------------------------------------------------
-- Buffer Navigation
keymap("n", "<S-l>", "<cmd>bnext<CR>", opts)
keymap("n", "<S-h>", "<cmd>bprevious<CR>", opts)
keymap("n", "<S-q>", "<cmd>bd<CR>", opts) -- close buffers

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
keymap("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
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
-- Write
keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Write" }, opts)

-- Write and quit
keymap("n", "<leader>W", "<cmd>wq<CR>", { desc = "Write and Quit" }, opts)

-- Quit
keymap("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" }, opts)

-- Quit without save
-- keymap("n", "<leader>Q", "<cmd>q!<CR>", { desc = "Quit (No Save)" }, opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "No highlights" }, opts)

------------------------------------------------
-- Insert --------------------------------------
------------------------------------------------
-- Quickly exit insert mode
keymap("i", "jk", "<ESC>", opts)

------------------------------------------------
-- Visual --------------------------------------
------------------------------------------------
-- Format Markdown Tables
keymap("v", "<leader>mt", "!pandoc -t markdown-simple_tables<CR>",
  { desc = 'Align Mardown Table Using Pandoc' }, opts)

------------------------------------------------
-- SNIPPETS ------------------------------------
------------------------------------------------
keymap("n", "<leader>xp", "o```{python}<cr>```<esc>O", { desc = "Python code chunk" }, opts)
keymap("n", "<leader>xr", "o```{r}<cr>```<esc>O", { desc = "R code chunk" }, opts)
keymap("n", "<leader>xt", "o```{=tex}<cr>```<esc>O", { desc = "TeX code chunk" }, opts)

