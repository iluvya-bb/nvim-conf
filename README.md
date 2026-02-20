# Luvya's Neovim Config

```
 ██╗     ██╗   ██╗██╗   ██╗██╗   ██╗ █████╗
 ██║     ██║   ██║██║   ██║╚██╗ ██╔╝██╔══██╗
 ██║     ██║   ██║██╗   ██║ ╚████╔╝ ███████║
 ██║     ██║   ██║╚██╗ ██╔╝  ╚██╔╝  ██╔══██║
 ███████╗╚██████╔╝ ╚████╔╝    ██║   ██║  ██║
 ╚══════╝ ╚═════╝   ╚═══╝     ╚═╝   ╚═╝  ╚═╝
          n e o v i m   c o n f i g
```

> Modern Neovim 0.11+ configuration with native LSP, comprehensive inlay hints, and optimized development workflow

---

## Quick Start

| Key | What it does |
|-----|-------------|
| `Space` | Leader key |
| `Space w` | Save file |
| `Space ff` | Find files |
| `Space gg` | Open LazyGit |
| `Space -` | Toggle file explorer |
| `Space ih` | Toggle inlay hints |
| `C-\` | Toggle terminal |
| `Tab` / `S-Tab` | Navigate buffers |

---

## Keymaps

### Files & Navigation

| Key | Action |
|-----|--------|
| `<leader>w` | Save file |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | List buffers |
| `<leader>fr` | Recent files |
| `<leader>fh` | Help tags |
| `<leader>ft` | Find TODOs |
| `<leader>-` | Toggle file explorer |
| `<leader>o` | Focus file explorer |

### Buffers

| Key | Action |
|-----|--------|
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<leader>x` | Close buffer |

### Splits

| Key | Action |
|-----|--------|
| `<leader>sv` | Split vertical |
| `<leader>sh` | Split horizontal |
| `<leader>h/j/k/l` | Navigate splits |
| `<leader>+/-` | Resize height |
| `<leader></>` | Resize width |
| `<leader>=` | Equal size splits |
| `<leader>q` | Close split |

---

## LSP

### Navigation

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<leader>D` | Type definition |

### Actions

| Key | Action |
|-----|--------|
| `<leader>ca` | Code action |
| `<leader>rn` | Rename symbol |
| `<leader>cf` | Format buffer |
| `<leader>lr` | Restart LSP |

### Diagnostics

| Key | Action |
|-----|--------|
| `gl` | Show diagnostic float |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>q` | Diagnostics to loclist |

### Inlay Hints

| Key | Action |
|-----|--------|
| `<leader>ih` | Toggle inlay hints |

Inlay hints show inline type annotations, parameter names, and more.

### Trouble (Diagnostics List)

| Key | Action |
|-----|--------|
| `<leader>xx` | All diagnostics |
| `<leader>xX` | Buffer diagnostics |
| `<leader>xl` | Location list |
| `<leader>xq` | Quickfix list |
| `<leader>xt` | Todo list |

### Symbols Outline

| Key | Action |
|-----|--------|
| `<leader>cs` | Toggle symbols outline |

---

## Rust

Full rust-analyzer support with clippy, inlay hints, and completions.

| Key | Action |
|-----|--------|
| `<leader>rC` | Create Cargo.toml (for standalone files) |

**Note:** rust-analyzer requires a Cargo project for full diagnostics. Use `<leader>rC` to create a `Cargo.toml` for standalone `.rs` files, then `:LspRestart`.

---

## Debugger (DAP)

| Key | Action |
|-----|--------|
| `<leader>db` | Toggle breakpoint |
| `<leader>dc` | Continue |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>dO` | Step out |
| `<leader>dr` | Open REPL |
| `<leader>dl` | Run last |
| `<leader>du` | Toggle DAP UI |
| `<leader>dt` | Terminate |

---

## Search & Replace (Spectre)

| Key | Action |
|-----|--------|
| `<leader>sr` | Open search/replace |
| `<leader>sw` | Search current word |
| `<leader>sp` | Search in current file |

---

## Git

| Key | Action |
|-----|--------|
| `<leader>gg` | Open LazyGit |

---

## Terminal

| Key | Action |
|-----|--------|
| `<C-\>` | Toggle terminal |
| `<leader>tf` | Float terminal |
| `<leader>th` | Horizontal terminal |
| `<leader>tv` | Vertical terminal |

---

## Motion & Editing

### Leap

| Key | Action |
|-----|--------|
| `s` + 2 chars | Leap forward |
| `S` + 2 chars | Leap backward |
| `gs` + 2 chars | Leap to any window |

### Surround

| Key | Action |
|-----|--------|
| `ys{motion}{char}` | Add surround |
| `cs{old}{new}` | Change surround |
| `ds{char}` | Delete surround |

### Comments

| Key | Action |
|-----|--------|
| `gcc` | Toggle comment (line) |
| `gc` | Toggle comment (visual) |

### TODO Comments

| Key | Action |
|-----|--------|
| `]t` | Next TODO |
| `[t` | Previous TODO |

---

## Sessions

| Key | Action |
|-----|--------|
| `<leader>qs` | Restore session |
| `<leader>ql` | Restore last session |
| `<leader>qd` | Don't save session |

---

## Folds

| Key | Action |
|-----|--------|
| `zR` | Open all folds |
| `zM` | Close all folds |
| `zK` | Peek folded lines |

---

## Misc

| Key | Action |
|-----|--------|
| `<leader>u` | Toggle undo tree |

---

## Languages Supported

| Language | LSP | Formatter | Debugger | Inlay Hints | Key Features |
|----------|-----|-----------|----------|-------------|--------------|
| Rust | rust_analyzer | rustfmt | - | ✅ | Standalone file support, clippy integration |
| Python | pyright | black, isort | debugpy | ✅ | Auto discovery, type hints |
| Go | gopls | gofmt, goimports | delve | ✅ | Staticcheck, enhanced hints |
| TypeScript/JS | ts_ls | prettier | node-debug2 | ✅ | JSX support, path mapping |
| C/C++ | clangd | clang-format | - | ✅ | clang-tidy integration |
| Lua | lua_ls | stylua | - | ✅ | Neovim API completion |
| TOML | taplo | taplo | - | - | Configuration support |
| **Extra** | - | - | - | - | **Markdown, YAML, JSON, Bash**

---

## Features

### Core Features
- **Native LSP** (Neovim 0.11+) - Fast, built-in language server protocol
- **Universal Inlay Hints** - Inline type annotations, parameter names, return types
- **LSP Signature** - Function signatures and parameter hints while typing
- **Smart Auto-save** - Files saved after 1 second of inactivity with notifications
- **Auto-close Tags** - HTML/JSX tags automatically closed and renamed
- **Format on Save** - Automatic formatting with silent error handling
- **Rich Snippets** - VSCode-compatible snippets with friendly-snippets
- **Inline Diagnostics** - Errors, warnings, and hints at end of lines

### UI/UX Enhancements
- **Dashboard** - Custom alpha-nvim startup screen with quick actions
- **Bufferline** - Modern tabs with diagnostics and close buttons
- **Statusline** - Lualine with git info, LSP status, and mode indicators
- **Indent Guides** - Scope-aware indentation with rainbow colors
- **Colorizer** - Inline color preview for CSS, HTML, and color codes
- **Better Folds** - UFO folding with Treesitter integration

### Navigation & Search
- **Telescope** - Fuzzy finder with fzf integration and number selections
- **Leap Motion** - Lightning-fast navigation with 2-character jumps
- **Project Management** - Automatic project detection and switching
- **File Explorer** - Nvim-tree with git integration and icons

---

## Plugin Architecture

### Package Management
- **lazy.nvim** - Blazing fast plugin manager with lazy loading
- **Mason.nvim** - LSP server, formatter, and debugger management

### Core Editing
- **nvim-treesitter** - Syntax highlighting and code understanding
- **nvim-cmp** - Autocomplete with LSP, snippets, and path sources
- **LuaSnip** - Powerful snippet engine with VSCode compatibility
- **nvim-autopairs** - Automatic bracket and quote pairing
- **nvim-surround** - Add/delete/change surrounding characters

### UI & Appearance
- **catppuccin/nvim** - Modern theme with comprehensive integrations
- **lualine.nvim** - Customizable statusline with git and LSP info
- **bufferline.nvim** - Buffer tabs with diagnostics and close buttons
- **indent-blankline.nvim** - Scope-aware indentation guides
- **alpha-nvim** - Custom startup dashboard
- **nvim-web-devicons** - File type icons throughout the UI

### Development Tools
- **Native LSP (vim.lsp)** - Built-in language server protocol implementation
- **conform.nvim** - Modern formatting with async support
- **nvim-dap** - Debug Adapter Protocol integration
- **nvim-spectre** - Project-wide search and replace
- **nvim-ufo** - Advanced folding with Treesitter
- **outline.nvim** - Symbol outline and navigation

### Navigation & Utilities
- **telescope.nvim** - Fuzzy finder with file search, grep, and extensions
- **leap.nvim** - Lightning-fast motion plugin
- **nvim-tree.lua** - File explorer with git integration
- **gitsigns.nvim** - Git signs and hunk navigation
- **lazygit.nvim** - Git UI integration
- **toggleterm.nvim** - Terminal management
- **which-key.nvim** - Keybinding hints and discovery

### Quality of Life
- **todo-comments.nvim** - Highlight and navigate TODO/FIXME comments
- **trouble.nvim** - Beautiful diagnostics list
- **persistence.nvim** - Session management
- **undotree** - Visual undo history
- **nvim-colorizer.lua** - Color code highlighting
- **auto-save.nvim** - Automatic file saving
- **nvim-ts-autotag** - Auto-close HTML/JSX tags

---

## Essential Commands

### Plugin & Tool Management
| Command | Action |
|---------|--------|
| `:Mason` | Manage LSP servers, formatters, debuggers |
| `:Lazy` | Plugin manager (update, clean, profile) |
| `:LspInfo` | Active LSP servers and buffer attachments |
| `:LspRestart` | Restart LSP servers (useful after config changes) |
| `:ConformInfo` | Formatter status and configuration |
| `:MasonInstall <tool>` | Install specific LSP or tool |

### UI & Navigation
| Command | Action |
|---------|--------|
| `:Outline` / `:OutlineOpen` | Toggle symbols outline |
| `:Trouble` | Diagnostics list with filtering |
| `:UndotreeToggle` | Visual undo history |
| `:NvimTreeToggle` | Toggle file explorer |
| `:Alpha` | Show dashboard |

### Development
| Command | Action |
|---------|--------|
| `:Glance` | LSP references/definitions preview |
| `:TodoTelescope` | Find all TODO/FIXME comments |
| `:Telescope projects` | Switch between projects |
| `:ToggleTerm` | Open terminal window |
| `:LazyGit` | Open git interface |

### Configuration
| Command | Action |
|---------|--------|
| `:e $MYVIMRC` | Edit Neovim config |
| `:lua require('persistence').load()` | Restore session |
| `:lua vim.lsp.inlay_hint.enable(0)` | Disable inlay hints |

---

---

## Configuration Structure

```
~/.config/nvim/
├── init.lua              # Main configuration, keymaps, and plugin loader
├── lua/
│   └── plugins/
│       ├── essentials.lua   # File explorer, telescope, bufferline, etc.
│       ├── lsp.lua          # Native LSP configuration with Mason
│       ├── completion.lua   # nvim-cmp with snippets and LSP sources
│       ├── colorscheme.lua  # Catppuccin theme with integrations
│       ├── treesitter.lua   # Syntax highlighting and parsing
│       ├── dashboard.lua    # Alpha dashboard + session management
│       └── extras.lua       # Formatters, debuggers, quality of life
└── README.md               # This documentation
```

## Performance & Optimizations

- **Lazy Loading** - Plugins load on-demand for faster startup
- **Native LSP** - Uses Neovim's built-in LSP for better performance
- **Async Operations** - Formatting and LSP operations work asynchronously
- **Minimal Dependencies** - Lightweight alternatives to heavy plugins
- **Smart Caching** - Treesitter and LSP results cached efficiently

## Installation

1. **Backup existing config** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. **Clone this configuration**:
   ```bash
   git clone https://github.com/yourusername/nvim-config ~/.config/nvim
   ```

3. **Launch Neovim** - lazy.nvim will auto-install plugins:
   ```bash
   nvim
   ```

4. **Install language tools** - Open Mason:
   ```bash
   :Mason
   ```
   Install the tools you need (rust-analyzer, pyright, gopls, etc.)

---

```
  Crafted with equal parts frustration and coffee
  Optimized for modern development workflows
  
  ~ luvya
```
