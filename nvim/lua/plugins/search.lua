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

      telescope.setup({
        defaults = {
          sorting_strategy = 'ascending',
          layout_config = {
            prompt_position = 'top',
          },
        },
      })

      local builtin = require('telescope.builtin')
      local wk = require('which-key')

      wk.add({
        { '<leader>s', group = 'Telescope' },
        { '<leader>sh', builtin.help_tags, desc = '[S]earch [H]elp' },
        { '<leader>sf', builtin.find_files, desc = '[S]earch [F]iles' },
        { '<leader>sp', builtin.git_files, desc = '[S]earch [P]roject files' },
        { '<leader>sg', telescope.extensions.live_grep_args.live_grep_args, desc = '[S]earch by [G]rep' },
        { '<leader>sc', builtin.git_status, desc = '[S]earch git [C]hanges' },
        { '<leader>sb', builtin.buffers, desc = '[S]earch [B]uffers' },
        { '<leader>sr', builtin.resume, desc = '[S]earch [R]esume' },
      })
    end,
  },
}
