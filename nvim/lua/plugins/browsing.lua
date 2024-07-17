return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local utils = require('utils')

      require('oil').setup({
        view_options = {
          show_hidden = true,
          is_always_hidden = function(name, bufnr)
            local hide = {
              '.git',
              '.DS_Store',
            }
            return utils.includes(hide, name)
          end,
        },
      })

      local wk = require('which-key')
      wk.add({
        { '<leader>e', '<CMD>Oil<CR>', desc = 'Oil' },
      })
    end,
  },
}
