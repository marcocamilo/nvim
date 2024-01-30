return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    --  ┌────────────────────────────────────────────────────────────────────┐
    --                                  SETUP
    --  └────────────────────────────────────────────────────────────────────┘
    local setup = {
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = true, -- adds help for operators like d, y, ...
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true,     -- misc bindings to work with windows
          z = true,       -- bindings for folds, spelling and others prefixed with z
          g = true,       -- bindings for prefixed with g
        },
      },
      -- add operators that will trigger motion and text object completion
      -- to enable all native operators, set the preset / operators plugin above
      operators = { gc = "Comments" },
      key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
      },
      motions = {
        count = true,
      },
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = "<c-j>", -- binding to scroll down inside the popup
        scroll_up = "<c-k>", -- binding to scroll up inside the popup
      },
      window = {
        border = "none",      -- none, single, double, shadow
        position = "bottom",  -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
        padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,         -- value between 0-100 0 for fully opaque and 100 for fully transparent
        zindex = 1000,        -- positive value to position WhichKey above other floating windows.
      },
      layout = {
        height = { min = 4, max = 25 },                                              -- min and max height of the columns
        width = { min = 20, max = 50 },                                              -- min and max width of the columns
        spacing = 3,                                                                 -- spacing between columns
        align = "left",                                                              -- align columns left, center or right
      },
      ignore_missing = false,                                                        -- enable this to hide mappings for which you didn't specify a label
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
      show_help = true,                                                              -- show a help message in the command line for using WhichKey
      show_keys = true,                                                              -- show the currently pressed key and its label as a message in the command line
      triggers = "auto",                                                             -- automatically setup triggers
      -- triggers = {"<leader>"} -- or specifiy a list manually
      -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
      triggers_nowait = {
        -- marks
        "`",
        "'",
        "g`",
        "g'",
        -- registers
        '"',
        "<c-r>",
        -- spelling
        "z=",
      },
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for keymaps that start with a native binding
        i = { "j", "k" },
        v = { "j", "k" },
      },
      -- disable the WhichKey popup for certain buf types and file types.
      -- Disabled by default for Telescope
      disable = {
        buftypes = {},
        filetypes = {},
      },
    }
    --  ┌────────────────────────────────────────────────────────────────────┐
    --                                 OPTIONS
    --  └────────────────────────────────────────────────────────────────────┘
    local nopts = {
      mode = "n", -- NORMAL mode
      -- prefix: use "<leader>f" for example for mapping everything related to finding files
      -- the prefix is prepended to every mapping part of `mappings`
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = false, -- use `nowait` when creating keymaps
      expr = false, -- use `expr` when creating keymaps
    }

    local vopts = {
      mode = "v", -- NORMAL mode
      -- prefix: use "<leader>f" for example for mapping everything related to finding files
      -- the prefix is prepended to every mapping part of `mappings`
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = false, -- use `nowait` when creating keymaps
      expr = false, -- use `expr` when creating keymaps
    }
    --  ┌────────────────────────────────────────────────────────────────────┐
    --                                 MAPPINGS
    --  └────────────────────────────────────────────────────────────────────┘
    --  ┌────────────────────────────────────────────────────────────────────┐
    --                               Normal Mode
    --  └────────────────────────────────────────────────────────────────────┘
    local n_mappings = {
      -- ALPHA
      ["a"] = { "<cmd>Alpha<cr>", "Alpha" },

      -- NVIMTREE
      ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },

      ["f"] = {
        "<cmd>Telescope find_files<CR>",
        "Find files",
      },
      ["F"] = {
        "<cmd>Telescope live_grep<CR>",
        "Find Text",
      },
      ["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
      ["b"] = { "<cmd>Telescope bibtex<cr>", "Telescope BibTeX" },

      -- LAZY
      ["L"] = { "<cmd>Lazy<CR>", "Lazy" },

      -- MASON
      ["M"] = { "<cmd>Mason<CR>", "Mason" },

      -- LAZYGIT
      ["lg"] = { "<cmd>LazyGit<CR>", "LazyGit" },

      -- TELESCOPE
      -- ["b"] = {
      -- 	"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      -- 	"Buffers",
      -- },

      -- MARKDOWN
      m = {
        name = "Markdown",
        v = { "<cmd>MarkdownPreviewToggle<CR>", "Markdown Preview" },
        h = { "cmd>MarkdownHeaders<CR>", "Markdown Headers" },
      },
      -- LSP
      l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        D = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Buffer Diagnostics" },
        d = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Line Diagnostics" },
        w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
        f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
        k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
        r = { "<cmd>IncRename", "Smart rename" },
        R = { "<cmd>LspRestart<CR>", "Restart LSP" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = { "cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
      },
      -- SEARCH
      ["?"] = {
        name = "Search",
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>SearchBoxReplace<cr>", "Search and Replace" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        s = {
          "<cmd>set spell!<cr>",
          "Spell check",
          -- "<cmd>lua require('telescope.builtin').spell_suggest()"
          -- Add keymaps for spellcheck languages?
        },
        ["?"] = { "<cmd>Cheatsheet<CR>", "Cheatsheet" },
      },
      -- COMMENT BOX
      c = {
        b = {
          name = "Comment Box",
          l = {
            name = "Left aligned box",
            l = { "<cmd>CBllbox<CR>", "Left aligned text" },
            c = { "<cmd>CBlcbox<CR>", "Center aligned text" },
            r = { "<cmd>CBlrbox<CR>", "Right aligned text" },
          },
          c = {
            name = "Center aligned box",
            l = { "<cmd>CBclbox<CR>", "Left aligned text" },
            c = { "<cmd>CBccbox<CR>", "Center aligned text" },
            r = { "<cmd>CBcrbox<CR>", "Right aligned text" },
          },
          r = {
            name = "Right aligned box",
            l = { "<cmd>CBrlbox<CR>", "Left aligned text" },
            c = { "<cmd>CBrcbox<CR>", "Center aligned text" },
            r = { "<cmd>CBrrbox<CR>", "Right aligned text" },
          },
        },
      },
      -- T KEY
      t = {
        x = {
          name = "VimTeX",
          ["c"] = { "<cmd>VimtexCompile<CR>", "VimTeX Compile" },
          ["v"] = { "<cmd>VimtexView<CR>", "VimTeX View" },
        },
        ["v"] = { "<cmd>ToggleTerm direction=vertical size=55 name=vertical<CR>", "Toggle Term Vertical" },
        ["h"] = { "<cmd>ToggleTerm direction=horizontal name=horizontal<CR>", "Toggle Term Horizontal" },
        ["c"] = { "<cmd>ToggleTerm direction=float<CR>", "Toggle Term Center" },
      },
      -- S KEY
      s = {
        name = "Toggle Term Send",
        l = { "<cmd>ToggleTermSendCurrentLine<CR>", "Send Current Line" },
        b = { "Vgg<cmd>ToggleTermSendVisualLines<CR>''", "Send From Beginning to Current Line" },
        e = { "VG<cmd>ToggleTermSendVisualLines<CR>", "Send From Current Line to End" },
      },
      -- J KEY
      -- j = {
      --   name = "Jupyter",
      --   ["qt"] = { "<cmd>lua RunQtConsole()<CR>", "Run Qt Console" },
      --   ["c"] = { "[[:<Plug>(IPy-Run)<CR>]]", "Run Current Cell" },
        -- vim.keymap.set('n', '<leader>jqt', [[:lua RunQtConsole()<CR>]], { noremap = true, silent = true })
        -- vim.keymap.set('n', '<leader>jk', [[:IPython --existing --no-window<CR>]], { noremap = true, silent = true })
        -- vim.keymap.set('n', '<leader>jc', [[:<Plug>(IPy-RunCell)]], { noremap = true, silent = true })
        -- vim.keymap.set('n', '<leader>ja', [[:<Plug>(IPy-RunAll)]], { noremap = true, silent = true })
      -- }
      -- 4 KEY
      ["4"] = {
        name = "Quarto",
        p = { "<cmd>QuartoPreview<CR>", "Quarto Preview" },
      },
    }
    --  ┌────────────────────────────────────────────────────────────────────┐
    --                               Visual Mode
    --  └────────────────────────────────────────────────────────────────────┘
    local v_mappings = {
      t = {
        name = "Toggle Term",
        s = {
          name = "Toggle Term Send",
          l = { "<cmd>ToggleTermSendVisualLines<CR>", "Send Visual Lines" },
        },
      },
    }
    --  ┌────────────────────────────────────────────────────────────────────┐
    --                                  SETUP
    --  └────────────────────────────────────────────────────────────────────┘
    local which_key = require("which-key")

    which_key.setup(setup)
    which_key.register(n_mappings, nopts)
    which_key.register(v_mappings, vopts)
  end,
}
