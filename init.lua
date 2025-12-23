-- Core options
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8

-- Behavior
opt.splitright = true
opt.splitbelow = true
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 300
opt.clipboard = "unnamedplus"
opt.mouse = "a"

-- Disable netrw (using telescope/oil instead)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Keymaps
local map = vim.keymap.set

-- Split creation
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Split vertical" })
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "Split horizontal" })

-- Split navigation
map("n", "<leader>h", "<C-w>h", { desc = "Move to left split" })
map("n", "<leader>j", "<C-w>j", { desc = "Move to bottom split" })
map("n", "<leader>k", "<C-w>k", { desc = "Move to top split" })
map("n", "<leader>l", "<C-w>l", { desc = "Move to right split" })

-- Split resizing
map("n", "<leader>+", "<cmd>resize +5<cr>", { desc = "Increase height" })
map("n", "<leader>-", "<cmd>resize -5<cr>", { desc = "Decrease height" })
map("n", "<leader>>", "<cmd>vertical resize +5<cr>", { desc = "Increase width" })
map("n", "<leader><", "<cmd>vertical resize -5<cr>", { desc = "Decrease width" })
map("n", "<leader>=", "<C-w>=", { desc = "Equal size splits" })

-- Split management
map("n", "<leader>q", "<cmd>close<cr>", { desc = "Close split" })

-- Save
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })

-- Toggle inlay hints (global)
map("n", "<leader>ih", function()
    local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
    vim.lsp.inlay_hint.enable(not enabled, { bufnr = 0 })
    vim.notify("Inlay hints " .. (enabled and "disabled" or "enabled"))
end, { desc = "Toggle inlay hints" })

-- Create Cargo.toml for standalone Rust files
map("n", "<leader>rC", function()
    local dir = vim.fn.expand("%:p:h")
    local cargo_path = dir .. "/Cargo.toml"
    if vim.fn.filereadable(cargo_path) == 1 then
        vim.notify("Cargo.toml already exists", vim.log.levels.WARN)
        return
    end
    local name = vim.fn.fnamemodify(dir, ":t"):gsub("[^%w_]", "_")
    local content = string.format([[
[package]
name = "%s"
version = "0.1.0"
edition = "2021"
]], name)
    local f = io.open(cargo_path, "w")
    if f then
        f:write(content)
        f:close()
        vim.notify("Created Cargo.toml - restart LSP with :LspRestart")
    end
end, { desc = "Create Cargo.toml for standalone Rust" })

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup("plugins")
