local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
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

telescope.load_extension('live_grep_args')

vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fp', builtin.git_files)
vim.keymap.set('n', '<leader>fg', telescope.extensions.live_grep_args.live_grep_args)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
