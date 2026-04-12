local map = vim.keymap.set

-- Leader
vim.g.mapleader = " "

--------------------------------------------------
-- Search / UI behavior
--------------------------------------------------

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

--------------------------------------------------
-- Movement (preserve wrapped line behavior)
--------------------------------------------------

map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

--------------------------------------------------
-- Window navigation
--------------------------------------------------

map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus left" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus right" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus down" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus up" })

--------------------------------------------------
-- Resize splits
--------------------------------------------------

map("n", "<C-Up>", ":resize -2<CR>", { silent = true })
map("n", "<C-Down>", ":resize +2<CR>", { silent = true })
map("n", "<C-Left>", ":vertical resize +2<CR>", { silent = true })
map("n", "<C-Right>", ":vertical resize -2<CR>", { silent = true })

--------------------------------------------------
-- Buffers
--------------------------------------------------

map("n", "<S-l>", ":bnext<CR>", { silent = true })
map("n", "<S-h>", ":bprevious<CR>", { silent = true })

--------------------------------------------------
-- Move lines
--------------------------------------------------

map("n", "<A-j>", ":m .+1<CR>==", { silent = true })
map("n", "<A-k>", ":m .-2<CR>==", { silent = true })

--------------------------------------------------
-- Insert mode escape
--------------------------------------------------

map("i", "jk", "<ESC>", { silent = true })
map("i", "kj", "<ESC>", { silent = true })

--------------------------------------------------
-- Terminal
--------------------------------------------------

map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

--------------------------------------------------
-- Diagnostics (keep even without full LSP)
--------------------------------------------------

map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<leader>q", vim.diagnostic.setloclist)

--------------------------------------------------
-- Telescope (preserved exactly)
--------------------------------------------------

local builtin = require("telescope.builtin")

map("n", "<leader>sh", builtin.help_tags)
map("n", "<leader>sk", builtin.keymaps)
map("n", "<leader>sf", builtin.find_files)
map("n", "<leader>ss", builtin.builtin)
map("n", "<leader>sw", builtin.grep_string)
map("n", "<leader>sg", builtin.live_grep)
map("n", "<leader>sd", builtin.diagnostics)
map("n", "<leader>sr", builtin.resume)
map("n", "<leader>s.", builtin.oldfiles)
map("n", "<leader><leader>", builtin.buffers)

-- Current buffer fuzzy search
map("n", "<leader>/", function()
  builtin.current_buffer_fuzzy_find({
    winblend = 10,
    previewer = false,
  })
end)

-- Live grep in open files
map("n", "<leader>s/", function()
  builtin.live_grep({
    grep_open_files = true,
    prompt_title = "Live Grep in Open Files",
  })
end)

-- Search Neovim config
map("n", "<leader>sn", function()
  builtin.find_files({ cwd = vim.fn.stdpath("config") })
end)
