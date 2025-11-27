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
      local layout = require('telescope.actions.layout')

      telescope.setup({
        defaults = {
          cycle_layout_list = { 'vertical', 'flex' },
          sorting_strategy = 'ascending',
          layout_strategy = 'flex',
          layout_config = {
            vertical = {
              mirror = true,
            },
            horizontal = {
              preview_width = 0.5,
            },
            flip_columns = 160,
            prompt_position = 'top',
            width = function(_, cols, _)
              return math.min(180, math.floor(cols * 0.95))
            end,
            height = 0.95,
          },
          mappings = {
            n = {
              ['o'] = layout.toggle_preview,
              ['<C-l>'] = layout.cycle_layout_next,
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
        { '<leader>sc', builtin.git_status, desc = '[S]earch [C]hanged files' },
        { '<leader>sr', builtin.resume, desc = '[S]earch [R]esume' },
        {
          '<leader>so',
          function()
            builtin.oldfiles({ cwd_only = true })
          end,
          desc = '[S]earch [O]ld files',
        },
        { '<leader>sb', builtin.buffers, desc = '[S]earch [B]uffers' },
        { '<leader>st', builtin.current_buffer_fuzzy_find, desc = '[S]earch [T]his file' },
        { '<leader>ss', builtin.grep_string, desc = '[S]earch [S]tring' },
      })
    end,
  },
}
