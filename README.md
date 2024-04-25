# My Neovim Setup

Welcome to my Neovim setup! This repository contains my personal configuration for Neovim, tailored to my workflow and preferences. Below you'll find instructions on how to set up and use my configuration.

## Installation

To use my Neovim setup, just clone this repository to your local machine:

```bash
git clone https://github.com/your-username/nvim-setup.git ~/.config/nvim
```

## Features

My Neovim setup includes the following features:

- Custom key mappings for efficient navigation and editing, defined in the `whichkey.lua` file.
- Syntax highlighting and auto-completion for Python, Quarto, HTML, CSS, and LaTeX.
- Use of the `catppuccino` color scheme with a black background and the `MesloLGS Nerd Font Mono` font.
- Plugins for enhanced functionality, such as:
  - nvim-tree for file navigation, with custom icons inspired by Josean's nvim configuration.
  - Telescope for file exploring and fuzzy findings, with a horizontal window preview.
  - LazyGit for managing Git within Neovim.

## Usage

Once you've installed my Neovim setup, you can start using it right away. Here are some basic commands to get you started:

- **Navigation**: Use `h`, `j`, `k`, `l` to navigate between characters, lines, and words respectively.
- **Editing**: Use `i` to enter insert mode and start editing, `ESC` to exit insert mode and return to normal mode.
- **Saving and Quitting**: Use `:w` to save changes and `:q` to quit Neovim. To save and quit in one command, you can use `:wq`.
- **Plugins**: Utilize the installed plugins for additional functionality. Refer to their documentation for usage instructions.

## Packages

This Neovim config uses a number of plugins that fit my particular workflow. Feel free to remove and add plugins as you like. For my setup, these are the plugins/configurations I use:

- **alpha.lua**: custom Neovim startup screen with a background image and text.
- **autopairs.lua**: automatically inserts matching pairs of characters, such as parentheses, brackets, and quotes.
- **bufferline.lua**: displays open buffers at the top of the Neovim window for easy navigation.
- **cheatsheet.lua**: displays a cheatsheet with key mappings for the current mode when pressing `<leader>??`.
- **cmp.lua**: auto-completion support for various sources, such as buffers, snippets, and LSP.
- **colorizer.lua**: high-performance color highlighter for RGB, hex, CSS and other codes.
- **colorschemes.lua**: installs and configures custom colorschemes (later setup in `core.lua`).
- **comment-box.lua**: beautifies comment boxes using boxes and lines around selected text.
- **comment.lua**: smart and powerful comment plugin for Neovim.
- **copilot.lua**: integrates GitHub Copilot with Neovim for AI-assisted code completion.
- **core.lua**: defines default colorscheme and selects core settings and configurations from `LazyVim`.
- **dressing.lua**: improves the default vim.ui interfaces.
- **eyeliner.lua**: move faster with unique f/F/t/T indicators for each word on the line.
- **formatting.lua**: Configures auto-formatting for various file types using `efm-langserver` and `stylua`.
- **gitsigns.lua**: Displays Git status indicators in the sign column for added, modified, and removed lines.
- **headlines.lua**: Provides key mappings for navigating and folding headlines in Markdown files.
- **indentline.lua**: Displays vertical lines to indicate indentation levels in the buffer.
- **init.lua**: The main configuration file that loads all other Lua modules and plugins.
- **ipython.lua**: Configures IPython as the default Python REPL for Neovim.
- **jupyter.lua**: Configures Jupyter as the default Python REPL for Neovim.
- **lazygit.lua**: Integrates the `lazygit` terminal application with Neovim for Git management.
- **linting.lua**: Configures linting for various file types using `efm-langserver` and other linters.
- **lualine.lua**: Configures the status line with custom components, colors, and icons using the `lualine` plugin.
- **markdown.lua**: Configures syntax highlighting and auto-completion for Markdown files.
- **maximizer.lua**: Provides key mappings for toggling the maximized state of the current window.
- **md-headers.lua**: Provides key mappings for inserting Markdown headers at different levels.
- **mini-indentscope.lua**: Provides key mappings for navigating and folding code blocks based on indentation levels.
- **mini-surround.lua**: Provides key mappings for surrounding text with quotes, parentheses, and other characters.
- **multicursor.lua**: Provides key mappings for creating and manipulating multiple cursors in the buffer.
- **neoscroll.lua**: Configures smooth scrolling behavior for Neovim using the `neoscroll` plugin.
- **neotab.lua**: Configures tab behavior and appearance using the `neotabs` plugin.
- **noice.lua**: Provides key mappings for toggling the visibility of the Neovim status line and tab line.
- **notify.lua**: Displays notifications in the Neovim status line for various events, such as file saves and Git commits.
- **nvim-r.lua**: Configures the `nvim-r` plugin for working with R scripts in Neovim.
- **nvim-tree.lua**: Configures the `nvim-tree` file explorer with custom icons and key mappings.
- **nvim-web-devicons.lua**: Configures the `nvim-web-devicons` plugin for displaying file icons in the file explorer.
- **quarto.lua**: Configures syntax highlighting and auto-completion for Quarto files.
- **searchbox.lua**: Provides key mappings for searching and replacing text in the buffer using the `telescope` plugin.
- **slime.lua**: Configures the `slime` plugin for sending code from Neovim to a REPL.
- **substitute.lua**: Provides key mappings for searching and replacing text in the buffer.
- **telescope-bibtex.lua**: Provides key mappings for searching and inserting BibTeX references using the `telescope` plugin.
- **telescope.lua**: Configures the `telescope` fuzzy finder with custom settings and key mappings.
- **textobjects.lua**: Provides key mappings for selecting and operating on text objects, such as words, lines, and blocks.
- **todo-comments.lua**: Highlights TODO, FIXME, and other annotations in the buffer with custom colors.
- **toggleterm.lua**: Provides key mappings for toggling the visibility of the terminal window in Neovim.
- **treesitter.lua**: Configures the `nvim-treesitter` plugin for syntax highlighting and code analysis.
- **ufo.lua**: Configures the `ufo` plugin for working with UFO fonts in Neovim.
- **vimtex.lua**: Configures the `vimtex` plugin for editing LaTeX files in Neovim.
- **whichkey.lua**: Configures the `which-key` plugin for displaying key mappings and their descriptions.


## Contributing

If you have any suggestions for improving my Neovim setup or encounter any issues, feel free to open an issue or submit a pull request. Your feedback and contributions are highly appreciated!

## License

This Neovim setup is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
