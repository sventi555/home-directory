return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim',
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup({
        defaults = {
          sorting_strategy = 'ascending',
          layout_config = {
            prompt_position = 'top',
          },
          mappings = {
            n = {
              ['<C-d>'] = actions.delete_buffer,
              ['<C-h>'] = actions.which_key,
            },
            i = {
              ['<C-d>'] = actions.delete_buffer,
              ['<C-h>'] = actions.which_key,
            },
          },
        },
      })

      local builtin = require('telescope.builtin')
      local wk = require('which-key')

      wk.add({
        { '<leader>f', group = 'Telescope' },
        { '<leader>fh', builtin.help_tags, desc = '[F]ind [H]elp' },
        { '<leader>ff', builtin.find_files, desc = '[F]ind [F]iles' },
        { '<leader>fp', builtin.git_files, desc = '[F]ind [P]roject files' },
        { '<leader>fg', telescope.extensions.live_grep_args.live_grep_args, desc = '[F]ind by [G]rep' },
        { '<leader>fc', builtin.git_status, desc = '[F]ind git [C]hanges' },
        { '<leader>fb', builtin.buffers, desc = '[F]ind [B]uffers' },
        { '<leader>fr', builtin.resume, desc = '[F]ind [R]esume' },
      })
    end,
  },
}
