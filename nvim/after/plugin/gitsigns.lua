require('gitsigns').setup({
  current_line_blame_opts = {
    delay = 250
  },
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')
    local wk = require('which-key')

    wk.add({
      { '[h', function() gitsigns.nav_hunk('prev') end, desc = "Prev hunk" },
      { ']h', function() gitsigns.nav_hunk('next') end, desc = "Next hunk" }
    }, { buffer = bufnr })

    wk.add({
      { '<leader>g', group = "Git" },
      { '<leader>gd', function() gitsigns.diffthis() end, desc = "Diff buffer" },
      { '<leader>gr', function() gitsigns.reset_hunk() end, desc = "Reset hunk" },
      { '<leader>gR', function() gitsigns.reset_buffer() end, desc = "Reset buffer" },
      { '<leader>gp', function() gitsigns.preview_hunk() end, desc = "Preview hunk" },
      { '<leader>gb', function() gitsigns.toggle_current_line_blame() end, desc = "Toggle blame"}
    }, { buffer = bufnr })
  end
})
