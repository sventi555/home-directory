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
          mappings = {
            i = {
              ['<C-d>'] = require('telescope.actions').delete_buffer,
            },
            n = {
              ['<C-d>'] = require('telescope.actions').delete_buffer,
            },
          },
        },
      })

      local builtin = require('telescope.builtin')
      local wk = require('which-key')

      wk.add({
        { '<leader>s', group = 'Telescope' },
        { '<leader>sh', builtin.help_tags, desc = '[S]earch [H]elp' },
        { '<leader>sk', builtin.keymaps, desc = '[S]earch [K]eymaps' },
        { '<leader>sf', builtin.find_files, desc = '[S]earch [F]iles' },
        { '<leader>sp', builtin.git_files, desc = '[S]earch [P]roject files' },
        { '<leader>sg', telescope.extensions.live_grep_args.live_grep_args, desc = '[S]earch by [G]rep' },
        { '<leader>sc', builtin.git_status, desc = '[S]earch git [C]hanges' },
        { '<leader>sr', builtin.resume, desc = '[S]earch [R]esume' },
        {
          '<leader>so',
          function()
            builtin.oldfiles({ cwd_only = true })
          end,
          desc = '[S]earch [O]ld files',
        },
        { '<leader>b', builtin.buffers, desc = '[B]uffers' },
      })
    end,
  },
}
