# Neovim Configuration

This is my personal Neovim configuration, built with a focus on modularity and maintainability.

## 🚀 Features

- **Plugin Management**: Using `lazy.nvim` for efficient plugin loading
- **LSP Support**: Full Language Server Protocol support with Mason
- **Fuzzy Finding**: Using `fzf-lua` for fast file and content searching
- **Git Integration**: Git signs and commands
- **Modern UI**: Clean and efficient interface with custom statusline
- **Python Support**: Full Python development support with BasedPyright and Ruff

## 📋 Keymaps

### Leader Key
The leader key is set to `<Space>`. All leader-based commands start with this key.

### File Operations

| Keymap | Description | Mode |
|--------|-------------|------|
| `<leader>ff` | Find files | Normal |
| `<leader>fg` | Find git files | Normal |
| `<leader>fb` | Find buffers | Normal |
| `<leader>fe` | Toggle file explorer | Normal |

### Search and Navigation

| Keymap | Description | Mode |
|--------|-------------|------|
| `<leader>fw` | Find word in files | Normal |
| `<leader>fh` | Find help tags | Normal |
| `<leader>fm` | Find marks | Normal |
| `<leader>gc` | Git commits | Normal |
| `<leader>gb` | Git branches | Normal |

### LSP Keymaps

| Keymap | Description | Mode |
|--------|-------------|------|
| `gd` | Go to definition | Normal |
| `gr` | Go to references | Normal |
| `gI` | Go to implementation | Normal |
| `gD` | Go to declaration | Normal |
| `<leader>D` | Type definition | Normal |
| `<leader>ds` | Document symbols | Normal |
| `<leader>ws` | Workspace symbols | Normal |
| `<leader>rn` | Rename symbol | Normal |
| `<leader>ca` | Code actions | Normal |
| `K` | Hover documentation | Normal |
| `<leader>th` | Toggle inlay hints | Normal |

### Terminal

| Keymap | Description | Mode |
|--------|-------------|------|
| `<C-\>` | Toggle terminal | Normal |
| `<C-\>` | Toggle terminal | Terminal |

### Formatting

| Keymap | Description | Mode |
|--------|-------------|------|
| `<leader>f` | Format buffer | Normal |

## 🛠️ Plugin Configuration

### Core Plugins
- `vim-sleuth`: Automatic indentation detection
- `Comment.nvim`: Smart commenting
- `gitsigns.nvim`: Git integration
- `which-key.nvim`: Key binding hints

### LSP and Completion
- `nvim-lspconfig`: LSP configuration
- `mason.nvim`: LSP installer
- `nvim-cmp`: Completion engine
- `LuaSnip`: Snippet engine

### UI and Colors
- `tokyonight.nvim`: Colorscheme
- `todo-comments.nvim`: Todo comments
- `mini.statusline`: Status line

### File Management
- `oil.nvim`: File explorer
- `neo-tree.nvim`: File tree

### Python Development
- **LSP**: BasedPyright for Python language server
- **Formatting & Linting**: 
  - Ruff (fast Python linter and formatter)
  - Auto-formatting on save
  - 88 character line length
  - Import sorting
  - Code style enforcement
- **Features**:
  - Type checking
  - Inlay hints for types
  - Intelligent code completion

## 📁 Directory Structure

```
nvim/
├── init.lua              # Entry point
├── lua/
│   ├── core/            # Core settings
│   ├── keymaps/         # Key mappings
│   └── plugins/         # Plugin configurations
│       └── configs/     # Individual plugin configs
```

## 🔧 Requirements

- Neovim >= 0.11.0
- Git
- A Nerd Font (for icons)
- Python 3.8+ (for development)
- Ruff (installed automatically by Mason)

## 🚀 Installation

1. Clone this repository:
```bash
git clone <your-repo-url> ~/.config/nvim
```

2. Start Neovim and let it install plugins:
```bash
nvim
```

3. Wait for Mason to install Python tools:
```vim
:Mason
```

## 🔄 Updates

To update plugins:
```vim
:Lazy sync
```

## 📝 Notes

- The configuration is modular and easy to maintain
- Each plugin has its own configuration file
- LSP features are automatically configured for supported languages
- Formatting is handled by `conform.nvim`
- Python files are automatically formatted on save using Ruff
- BasedPyright provides type checking and intelligent code completion

## 🤝 Contributing

Feel free to submit issues and enhancement requests! 