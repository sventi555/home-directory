return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, bufnr)
          local utils = require('utils')

          local hide = {
            '.git',
            '.DS_Store',
          }
          return utils.includes(hide, name)
        end,
      },
    },
    keys = {
      { '<leader>e', '<CMD>Oil<CR>', desc = 'Oil' },
    },
  },
}
