-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Iterate over all Lua files in the plugins directory and load them
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir) do
  if type == 'file' and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('custom.plugins.' .. module)
  end
end

-- Install plugins here
do
  -- Support for todo.txt files
  vim.pack.add {"https://github.com/notbalanced/todo.txt-vim"}

  -- Add OneDark colorscheme
  vim.pack.add {"https://github.com/navarasu/onedark.nvim"}
  require('onedark').setup {
    style = 'dark'
  }
  require('onedark').load()

  -- Set lualine as status line
  vim.pack.add {"https://github.com/nvim-lualine/lualine.nvim"}
  -- See `:help lualine.txt`
  require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'neo-tree', 'dashboard', 'alpha' },
        always_divide_middle = true,
      },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { 'filename' },
      -- lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },

      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {},
    },
  }

  -- Set bufferline for top line
  vim.pack.add {"https://github.com/akinsho/bufferline.nvim"}
  require('bufferline').setup {
    options = {
      numbers = 'none', -- |"ordinal"|"buffer_id"|"both"|"function({{ordinal, id, lower, raise}):string,
      close_command = 'bdelete! %d',
      right_mouse_command = 'bdelete! %d',
      left_mouse_command = 'buffer %d',
      middle_mouse_command = nil,
      indicator = {
        icon = '▎', -- this should be omitted if indicator style is not 'icon'
        style = 'icon', -- | 'underline' | 'none',
      },
      buffer_close_icon = '',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      max_name_length = 30,
      max_prefix_length = 30,
      tab_size = 21,
      diagnostics = false,
      diagnostics_update_in_insert = false,
      offsets = { { filetype = 'NvimTree', text = '', padding = 1 } },
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      separator_style = 'thin', -- | "thick"
      enforce_regular_tabs = true,
      always_show_bufferline = true,
    },
  }

end
