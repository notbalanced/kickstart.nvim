-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
  },
  config = function()
    require('nvim-tree').setup {
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      renderer = {
        root_folder_modifier = ':t',
      },
      view = {
        width = 30,
        side = 'left',
        --         mappings = {
        --           list = {
        --             { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        --             { key = "h", cb = tree_cb "close_node" },
        --             { key = "v", cb = tree_cb "vsplit" },
        --           },
        --         },
      },
    }
  end,
}
