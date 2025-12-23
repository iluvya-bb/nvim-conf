# Luvya's Neovim Config

```
 ██╗     ██╗   ██╗██╗   ██╗██╗   ██╗ █████╗
 ██║     ██║   ██║██║   ██║╚██╗ ██╔╝██╔══██╗
 ██║     ██║   ██║██║   ██║ ╚████╔╝ ███████║
 ██║     ██║   ██║╚██╗ ██╔╝  ╚██╔╝  ██╔══██║
 ███████╗╚██████╔╝ ╚████╔╝    ██║   ██║  ██║
 ╚══════╝ ╚═════╝   ╚═══╝     ╚═╝   ╚═╝  ╚═╝
          n e o v i m   c o n f i g
```

> Neovim 0.11+ config with native LSP, inlay hints, and modern tooling

---

## Quick Start

| Key | What it does |
|-----|-------------|
| `Space` | Leader key |
| `Space w` | Save file |
| `Space ff` | Find files |
| `Space gg` | LazyGit |
| `Space -` | Toggle file explorer |

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

| Language | LSP | Formatter | Debugger | Inlay Hints |
|----------|-----|-----------|----------|-------------|
| Rust | rust_analyzer | rustfmt | - | Yes |
| Python | pyright | black, isort | debugpy | Yes |
| Go | gopls | gofmt, goimports | delve | Yes |
| TypeScript/JS | ts_ls | prettier | node-debug2 | Yes |
| C/C++ | clangd | clang-format | - | Yes |
| Lua | lua_ls | stylua | - | Yes |
| TOML | taplo | taplo | - | - |

---

## Features

- **Native LSP** (Neovim 0.11+) - Fast, native language server support
- **Inlay Hints** - Inline type annotations for all languages
- **LSP Signature** - Function signatures while typing
- **Auto-save** - Files saved after 1 second of inactivity
- **Auto-close Tags** - HTML/JSX tags automatically closed
- **Format on Save** - Automatic formatting (silent on error)
- **Snippets** - VSCode-compatible snippets via LuaSnip
- **Inline Diagnostics** - Errors shown at end of lines

---

## Plugin Stack

- **Package Manager:** lazy.nvim
- **Theme:** Catppuccin Mocha
- **File Explorer:** nvim-tree
- **File Finder:** Telescope + fzf
- **LSP:** Native vim.lsp + Mason
- **Completion:** nvim-cmp + LuaSnip + lspkind
- **Signature Help:** lsp_signature.nvim
- **Syntax:** Treesitter
- **Git:** Gitsigns + LazyGit
- **Motion:** Leap
- **Debugger:** nvim-dap + dap-ui
- **Search/Replace:** Spectre
- **Diagnostics:** Trouble
- **Symbols:** outline.nvim
- **Sessions:** persistence.nvim
- **Folds:** nvim-ufo
- **Lua Dev:** lazydev.nvim

---

## Commands

| Command | Action |
|---------|--------|
| `:Mason` | Manage LSP servers |
| `:Lazy` | Manage plugins |
| `:LspInfo` | LSP status |
| `:LspRestart` | Restart LSP |
| `:ConformInfo` | Formatter info |
| `:Outline` | Toggle symbols |
| `:Trouble` | Diagnostics panel |

---

```
  Made with mass mass mass mass mass frustration and mass mass mass mass mass coffee

  ~ luvya
```
