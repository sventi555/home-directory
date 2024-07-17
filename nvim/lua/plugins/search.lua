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
      local builtin = require('telescope.builtin')
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

      telescope.load_extension('live_grep_args')

      local wk = require('which-key')
      wk.add({
        { '<leader>f', group = 'Telescope' },
        { '<leader>ff', builtin.find_files, desc = 'Find files' },
        { '<leader>fp', builtin.git_files, desc = 'Find project files' },
        {
          '<leader>fs',
          telescope.extensions.live_grep_args.live_grep_args,
          desc = 'Live grep',
        },
        { '<leader>fg', builtin.git_status, desc = 'Find git changes' },
        { '<leader>fb', builtin.buffers, desc = 'Find buffers' },
        { '<leader>fh', builtin.help_tags, desc = 'Find help tags' },
      })
    end,
  },
}
