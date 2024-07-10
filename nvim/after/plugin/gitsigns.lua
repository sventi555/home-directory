require('gitsigns').setup({
  current_line_blame_opts = {
    delay = 250
  },
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')
    local wk = require('which-key')

    wk.register({
      ['[h'] = { function() gitsigns.nav_hunk('prev') end, "Prev hunk" },
      [']h'] = { function() gitsigns.nav_hunk('next') end, "Next hunk" }
    }, { buffer = bufnr })

    wk.register({
      ['<leader>g'] = {
        name = "Git",
        d = { gitsigns.diffthis, "Diff buffer" },
        r = { gitsigns.reset_hunk, "Reset hunk" },
        R = { gitsigns.reset_buffer, "Reset buffer" },
        p = { gitsigns.preview_hunk, "Preview hunk" },
        b = { gitsigns.toggle_current_line_blame, "Toggle blame"}
      }
    }, { buffer = bufnr })
  end
})
