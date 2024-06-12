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
vim.keymap.set('n', '<leader>e', "<CMD>Oil<CR>")
