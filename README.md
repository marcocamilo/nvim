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

## Contributing

If you have any suggestions for improving my Neovim setup or encounter any issues, feel free to open an issue or submit a pull request. Your feedback and contributions are highly appreciated!

## License

This Neovim setup is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
