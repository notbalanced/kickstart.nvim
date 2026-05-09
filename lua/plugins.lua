-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  --------------------------------------------------
  -- Theme
  --------------------------------------------------
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup()
      require("onedark").load()
    end,
  },

  --------------------------------------------------
  -- Statusline
  --------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup {
        options = {
          theme = "onedark",
          icons_enabled = false,
        },
      }
    end,
  },

  --------------------------------------------------
  -- Bufferline (tabline)
  --------------------------------------------------
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({})
    end,
  },

  --------------------------------------------------
  -- Telescope
  --------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({})
    end,
  },

  --------------------------------------------------
  -- Git
  --------------------------------------------------
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  --------------------------------------------------
  -- Commenting
  --------------------------------------------------
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        view_options = {
          show_hidden = true,
        },
      })
    end,
  },
  {
      "folke/which-key.nvim",
      event = "VeryLazy",
      config = function()
          require("which-key").setup({
              delay = 0,
          })
      end,
  },
})

