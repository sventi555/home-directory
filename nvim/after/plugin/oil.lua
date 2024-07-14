require('utils')

require("oil").setup({
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, bufnr)
      hide = {
        '.git',
        '.DS_Store'
      }
      return includes(hide, name)
    end,
  }
})

local wk = require('which-key')
wk.add({
  { '<leader>e', '<CMD>Oil<CR>', desc = 'Oil' }
})
