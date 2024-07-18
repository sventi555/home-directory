return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim',
    },
    opts = {
      defaults = {
        sorting_strategy = 'ascending',
        layout_config = {
          prompt_position = 'top',
        },
        mappings = {
          n = {
            ['<C-d>'] = function()
              require('telescope.actions').delete_buffer()
            end,
            ['<C-h>'] = function()
              require('telescope.actions').which_key()
            end,
          },
          i = {
            ['<C-d>'] = function()
              require('telescope.actions').delete_buffer()
            end,
            ['<C-h>'] = function()
              require('telescope.actions').which_key()
            end,
          },
        },
      },
    },
    keys = {
      { '<leader>f', group = 'Telescope' },
      {
        '<leader>ff',
        function()
          require('telescope.builtin').find_files()
        end,
        desc = 'Find files',
      },
      {
        '<leader>fp',
        function()
          require('telescope.builtin').git_files()
        end,
        desc = 'Find project files',
      },
      {
        '<leader>fs',
        function()
          require('telescope').extensions.live_grep_args.live_grep_args()
        end,
        desc = 'Live grep',
      },
      {
        '<leader>fg',
        function()
          require('telescope.builtin').git_status()
        end,
        desc = 'Find git changes',
      },
      {
        '<leader>fb',
        function()
          require('telescope.builtin').buffers()
        end,
        desc = 'Find buffers',
      },
      {
        '<leader>fh',
        function()
          require('telescope.builtin').help_tags()
        end,
        desc = 'Find help tags',
      },
    },
  },
}
