--- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a nerd font installed and selected in the terminal
vim.g.have_nerd_font = true

-- UI
vim.opt.number = true           -- Make line numbers default
--vim.opt.relativenumber = true   -- Relative line numbers
vim.opt.mouse = 'nv'            -- Set mode for mouse
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
-- Set guifont
if vim.fn.has("win32") == 1 then
    -- Windows specific font
    vim.opt.guifont = 'CaskaydiaCove NF:h10'
else
    -- Linux font
    vim.opt.guifont = 'CaskaydiaCove Nerd Font Mono:h12'
end

-- Clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.autocomplete = true
-- Indentation
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Wrapping
vim.opt.breakindent = true
vim.opt.linebreak = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = false

-- Timing
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Scroll
vim.opt.scrolloff = 10

-- Whitespace chars
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Undo
vim.opt.undofile = true

-- Live substitute preview
vim.opt.inccommand = "split"

-- Built-in syntax (NO treesitter)
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

--------------------------------------------------
-- Autocommands
--------------------------------------------------

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Trim trailing whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})
