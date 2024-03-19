return {
  {
    "tadmccorkle/markdown.nvim",
    event = "VeryLazy",
    opts = {
      -- configuration here or empty for defaults
      mappings = {
        go_curr_heading = "].", -- (string|boolean) set cursor to current section heading
        go_parent_heading = "]k", -- (string|boolean) set cursor to parent section heading
        go_next_heading = "<C-j>", -- (string|boolean) set cursor to next section heading
        go_prev_heading = "<C-k>", -- (string|boolean) set cursor to previous section heading
      },
      on_attach = function(bufnr)
        local function toggle(key)
          return "<Esc>gv<Cmd>lua require'markdown.inline'"
            .. ".toggle_emphasis_visual'" .. key .. "'<CR>"
        end

        vim.keymap.set("x", "<C-b>", toggle("b"), { buffer = bufnr })
        vim.keymap.set("x", "<C-i>", toggle("i"), { buffer = bufnr })
      end,
    },
  },
  {
    "bullets-vim/bullets.vim",
    init = function()
      vim.g.bullets_enabled_file_types = { 
        'markdown', 
        'quarto',
        'text',
        'gitcommit',
        'scratch' 
      }
      vim.g.bullets_set_mappings = 0
      vim.g.bullets_custom_mappings = {
        {'imap', '<cr>', '<Plug>(bullets-newline)'},
        {'nmap', '<leader>x', '<Plug>(bullets-toggle-checkbox)'},
        {'nmap', '>>', '<Plug>(bullets-demote)'},
        {'nmap', '<<', '<Plug>(bullets-promote)'},
      }
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown", "quarto" }
      vim.g.mkdp_auto_close = true
      vim.g.mkdp_open_to_the_world = false
      vim.g.mkdp_open_ip = "127.0.0.1"
      vim.g.mkdp_port = "8888"
      vim.g.mkdp_echo_preview_url = true
      vim.g.mkdp_page_title = "${name}"
    end,
    ft = { "markdown", "quarto" },
  },
}
