-- Options file

-- Enable break indent
vim.o.linebreak = true

-- Indenting
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.autowrite = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.cursorline = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Set guifont
if vim.fn.has("win32") == 1 then
    -- Windows specific font
    vim.o.guifont = "CaskaydiaCove NF:h10"
else
    -- Linux font
    vim.o.guifont = 'CaskaydiaCove Nerd Font Mono:h12'
end


-- Wrapping
vim.opt.wrap = true         -- wrap lines by default
vim.opt.breakindent = true
vim.opt.linebreak = true

-- Don't line wrap for following file types
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "cpp", "c", "h", "tpp", "cmake", "make", "py", "lua" },
    callback = function()
        vim.opt_local.wrap = false
        vim.opt_local.linebreak = false
        vim.opt_local.breakindent = false
    end,
})

-- Whitespace chars
vim.opt.list = true
vim.opt.listchars = { tab = "» ", lead = "·", trail = "·", nbsp = "␣" }
