-- Basic settings
vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- Clipboard (works on Linux/macOS, Windows may need win32yank)
vim.opt.clipboard = "unnamedplus"

-- Faster updates
vim.opt.updatetime = 250

-- Built-in syntax instead of treesitter
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
