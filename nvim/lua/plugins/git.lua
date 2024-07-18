return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame_opts = {
        delay = 250,
      },
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')
        local wk = require('which-key')

        wk.add({
          {
            '[h',
            function()
              gitsigns.nav_hunk('prev')
            end,
            desc = 'Prev hunk',
          },
          {
            ']h',
            function()
              gitsigns.nav_hunk('next')
            end,
            desc = 'Next hunk',
          },
        }, { buffer = bufnr })

        wk.add({
          { '<leader>g', group = 'Git' },
          { '<leader>gd', gitsigns.diffthis, desc = 'Diff buffer' },
          { '<leader>gr', gitsigns.reset_hunk, desc = 'Reset hunk' },
          { '<leader>gR', gitsigns.reset_buffer, desc = 'Reset buffer' },
          { '<leader>gp', gitsigns.preview_hunk, desc = 'Preview hunk' },
          { '<leader>gb', gitsigns.toggle_current_line_blame, desc = 'Toggle blame' },
        }, { buffer = bufnr })
      end,
    },
  },
}
