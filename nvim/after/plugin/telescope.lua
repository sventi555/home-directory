local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    sorting_strategy = 'ascending',
    layout_strategy = 'vertical',
    layout_config = {
      mirror = true,
      prompt_position = 'top'
    },
    mappings = {
      n = {
        ['<C-d>'] = actions.delete_buffer,
        ['<C-h>'] = actions.which_key
      },
      i = {
        ['<C-d>'] = actions.delete_buffer,
        ['<C-h>'] = actions.which_key
      }
    }
  }
})

vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fp', builtin.git_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
