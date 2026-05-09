local map = vim.keymap.set

--------------------------------------------------
-- Search
--------------------------------------------------
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

--------------------------------------------------
-- Wrapped movement
--------------------------------------------------
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

--------------------------------------------------
-- Window navigation
--------------------------------------------------
map("n", "<C-h>", "<C-w><C-h>")
map("n", "<C-l>", "<C-w><C-l>")
map("n", "<C-j>", "<C-w><C-j>")
map("n", "<C-k>", "<C-w><C-k>")

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
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")

--------------------------------------------------
-- Terminal
--------------------------------------------------
map("t", "<Esc>", [[<C-\><C-n>]])

--------------------------------------------------
-- Diagnostics
--------------------------------------------------
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<leader>q", vim.diagnostic.setloclist)

--------------------------------------------------
-- Telescope
--------------------------------------------------

map("n", "<leader>sh", function() require("telescope.builtin").help_tags() end, {desc="Search Help"})
map("n", "<leader>sk", function() require("telescope.builtin").keymaps() end, {desc="Search Keymaps"})
map("n", "<leader>sf", function() require("telescope.builtin").find_files() end, {desc="Search Files"})
map("n", "<leader>ss", function() require("telescope.builtin").builtin() end, {desc="Search Select Telescope"})
map("n", "<leader>sw", function() require("telescope.builtin").grep_string() end, {desc="Search Word"})
map("n", "<leader>sg", function() require("telescope.builtin").live_grep() end, {desc="Search Grep"})
map("n", "<leader>sd", function() require("telescope.builtin").diagnostics() end, {desc="Search Diagnostics"})
map("n", "<leader>sr", function() require("telescope.builtin").resume() end, {desc="Search Resume"})
map("n", "<leader>s.", function() require("telescope.builtin").oldfiles() end, {desc="Search Recent Files"})
map("n", "<leader><leader>", function() require("telescope.builtin").buffers() end, {desc="Find Buffers"})

map("n", "<leader>/", function()
  require("telescope.builtin").current_buffer_fuzzy_find({
    winblend = 10,
    previewer = false,
  })
end, {desc="Search Open Files"})

map("n", "<leader>s/", function()
  require("telescope.builtin").live_grep({
    grep_open_files = true,
    prompt_title = "Live Grep in Open Files",
  })
end, {desc="Search Open Files"})

map("n", "<leader>sn", function()
  require("telescope.builtin").find_files({
    cwd = vim.fn.stdpath("config"),
  })
end, {desc="Search Nvim config"})

-----------------------------------------
---File Explorer
-----------------------------------------
map("n", "<leader>e", "<cmd>Oil<CR>", {desc="Open File Explorer"})

