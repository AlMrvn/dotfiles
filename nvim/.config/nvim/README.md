# Neovim Configuration

This is my personal Neovim configuration, built with a focus on modularity and maintainability.

## 🚀 Features

- **Plugin Management**: Using `lazy.nvim` for efficient plugin loading
- **LSP Support**: Full Language Server Protocol support with Mason
- **Modern UI**: Clean and efficient interface with Tokyo Night theme
- **Smart Navigation**: Flash navigation and enhanced text objects
- **File Management**: Dual file explorers (Oil.nvim and Neo-tree)
- **Code Quality**: Built-in formatting and linting support

## 📋 Keymaps

### Leader Key
The leader key is set to `<Space>`. All leader-based commands start with this key.

### Keymap Organization
All keymaps follow a consistent pattern using the [Action] [Target] format:

1. **Find Commands** (`<leader>f`): [F]ind [X]
   - `ff` - [F]ind [F]iles
   - `fe` - [F]ind [E]xplorer
   - `fb` - [F]ind [B]uffers
   - `fw` - [F]ind [W]ord
   - `fh` - [F]ind [H]elp
   - `fm` - [F]ind [M]arks
   - `fd` - [F]ind [D]ebug Info
   - `ft` - [F]ind [T]race

2. **Git Commands** (`<leader>g`): [G]it [X]
   - `gf` - [G]it [F]iles
   - `gc` - [G]it [C]ommits
   - `gb` - [G]it [B]ranches
   - `gl` - [G]it [L]ine Blame

3. **Use Commands** (`<leader>u`): [U]se [X]
   - `us` - [U]se [S]pell
   - `uw` - [U]se [W]rap
   - `ul` - [U]se [L]ine Numbers
   - `ud` - [U]se [D]iagnostics
   - `uh` - [U]se [H]ints
   - `un` - [U]se [N]otifications

4. **Notification Commands** (`<leader>n`): [N]otification [X]
   - `nh` - [N]otification [H]istory

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

### Text Objects and Surround

| Keymap | Description | Mode |
|--------|-------------|------|
| `sa` | Add surrounding | Normal |
| `sd` | Delete surrounding | Normal |
| `sr` | Replace surrounding | Normal |
| `sn` | Update surrounding | Normal |

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
- `fidget.nvim`: LSP status indicator

### UI and Colors
- `tokyonight.nvim`: Colorscheme
- `todo-comments.nvim`: Todo comments
- `mini.statusline`: Status line
- `paint.nvim`: Custom syntax highlighting

### File Management
- `oil.nvim`: File explorer
- `neo-tree.nvim`: File tree

### Navigation and Text Objects
- `flash.nvim`: Enhanced navigation
- `mini.ai`: Text objects
- `mini.surround`: Surround text

### Treesitter
- `nvim-treesitter`: Syntax highlighting and parsing

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

## 🚀 Installation

1. Clone this repository:
```bash
git clone <your-repo-url> ~/.config/nvim
```

2. Start Neovim and let it install plugins:
```bash
nvim
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
- Flash navigation provides quick movement within files
- Dual file explorers (Oil.nvim and Neo-tree) for different use cases

## 🤝 Contributing

Feel free to submit issues and enhancement requests! 