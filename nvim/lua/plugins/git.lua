return {
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>G', '<cmd>LazyGit<cr>', desc = 'Lazy[G]it' },
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
      },
      current_line_blame_opts = {
        delay = 250,
      },
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')
        local wk = require('which-key')

        wk.add({
          {
            '[c',
            function()
              gitsigns.nav_hunk('prev')
            end,
            desc = 'Prev [C]hange',
          },
          {
            ']c',
            function()
              gitsigns.nav_hunk('next')
            end,
            desc = 'Next [C]hange',
          },
        }, { buffer = bufnr })

        wk.add({
          { '<leader>g', group = 'Git' },
          { '<leader>gd', gitsigns.diffthis, desc = '[G]it [D]iff' },
          { '<leader>gr', gitsigns.reset_hunk, desc = '[G]it [R]eset hunk' },
          { '<leader>gp', gitsigns.preview_hunk, desc = '[G]it [P]review hunk' },
          { '<leader>gb', gitsigns.toggle_current_line_blame, desc = '[G]it [B]lame toggle' },
        }, { buffer = bufnr })
      end,
    },
  },
}
