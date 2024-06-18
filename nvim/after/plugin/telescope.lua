require('telescope').setup({
  defaults = {
    sorting_strategy = 'ascending',
    layout_strategy = 'horizontal',
    layout_config = {
      prompt_position = 'top'
    },
    mappings = {
      n = {
        ['<C-d>'] = require('telescope.actions').delete_buffer
      },
      i = {
        ['<C-d>'] = require('telescope.actions').delete_buffer
      }
    }
  }
})
vim.keymap.set('n', '<leader>ff', '<Cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fp', '<Cmd>Telescope git_files<CR>')
vim.keymap.set('n', '<leader>fg', '<Cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>fb', '<Cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fh', '<Cmd>Telescope help_tags<CR>')
