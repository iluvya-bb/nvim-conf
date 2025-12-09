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

> *"Because real devs don't use IDEs"* - probably someone

---

## Quick Start

| Key | What it does |
|-----|-------------|
| `Space` | Leader key (the magic button) |
| `Space w` | Save your masterpiece |
| `Space ff` | Find files fast |
| `Space gg` | Git goes brrrr (LazyGit) |
| `-` | Browse files like a boss |

---

## Keymaps

### Files & Navigation

| Key | Action |
|-----|--------|
| `<leader>w` | Save file |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search text) |
| `<leader>fb` | List buffers |
| `<leader>fr` | Recent files |
| `<leader>fh` | Help tags |
| `<leader>fp` | Projects |
| `<leader>ft` | Find TODOs |
| `-` | File browser |

### File Browser (Telescope)

| Key | Action |
|-----|--------|
| `<CR>` | Open file / Enter directory |
| `<Backspace>` | Go to parent directory |
| `c` / `<C-c>` | Create file/folder |
| `r` / `<C-r>` | Rename |
| `d` / `<C-d>` | Delete |
| `y` / `<C-y>` | Copy |
| `m` / `<C-x>` | Move |

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

### LSP (the smart stuff)

| Key | Action |
|-----|--------|
| `gd` | Go to definition (preview) |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename symbol |
| `<leader>D` | Type definition |
| `<leader>e` | Show diagnostic |
| `[d` / `]d` | Prev/Next diagnostic |
| `<leader>cf` | Format buffer |

### Diagnostics (Trouble)

| Key | Action |
|-----|--------|
| `<leader>xx` | All diagnostics |
| `<leader>xX` | Buffer diagnostics |
| `<leader>xl` | Location list |
| `<leader>xq` | Quickfix list |
| `<leader>xt` | Todo list |

---

### Git

| Key | Action |
|-----|--------|
| `<leader>gg` | Open LazyGit |

### Terminal

| Key | Action |
|-----|--------|
| `<C-\>` | Toggle terminal |
| `<leader>tf` | Float terminal |
| `<leader>th` | Horizontal terminal |
| `<leader>tv` | Vertical terminal |

---

### Motion (Leap)

```
Press 's' + 2 chars = teleport
```

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

```
ysiw"  →  "word"      (surround word with quotes)
cs'"   →  "word"      (change ' to ")
ds"    →  word        (delete quotes)
```

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

### Sessions

| Key | Action |
|-----|--------|
| `<leader>ss` | Restore session |
| `<leader>sl` | Restore last session |
| `<leader>sd` | Don't save session |

### Misc

| Key | Action |
|-----|--------|
| `<leader>u` | Toggle undo tree |

---

## Dashboard

```
┌──────────────────────────────────┐
│  f  Find file                    │
│  e  New file                     │
│  r  Recent files                 │
│  g  Find text                    │
│  b  File browser                 │
│  c  Config                       │
│  m  Mason (LSP installer)        │
│  l  Lazy (plugins)               │
│  q  Quit                         │
└──────────────────────────────────┘
```

---

## Commands

| Command | Action |
|---------|--------|
| `:Mason` | Manage LSP servers |
| `:Lazy` | Manage plugins |
| `:ColorizerToggle` | Toggle color highlighting |
| `:ConformInfo` | Formatter info |

---

## Languages Supported

| Language | LSP | Formatter |
|----------|-----|-----------|
| Python | pyright | black, isort |
| Go | gopls | gofmt, goimports |
| TypeScript/JS | ts_ls | prettier |
| C/C++ | clangd | clang-format |
| Lua | - | stylua |

---

## Plugin Stack

- **Package Manager:** lazy.nvim
- **Theme:** Catppuccin Mocha
- **File Finder:** Telescope
- **LSP:** Native + Mason
- **Completion:** nvim-cmp
- **Syntax:** Treesitter
- **Git:** Gitsigns + LazyGit
- **Motion:** Leap

---

```
  Made with mass mass mass mass mass frustration and mass mass mass mass mass coffee

  ~ luvya
```
