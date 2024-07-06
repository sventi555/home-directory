
require('gitsigns').setup({
  current_line_blame_opts = {
    delay = 250
  },
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')
    local wk = require('which-key')

    wk.register({
      [']c'] = {
        function()
          if vim.wo.diff then
            vim.cmd.normal({']c', bang = true})
          else
            gitsigns.nav_hunk('next')
          end
        end,
        "Next hunk"
      },
      [']c'] = {
        function()
          if vim.wo.diff then
            vim.cmd.normal({'[c', bang = true})
          else
            gitsigns.nav_hunk('prev')
          end
        end,
        "Prev hunk"
      }
    }, { buffer = bufnr })

    wk.register({
      ['<leader>g'] = {
        name = "Git",
        s = { gitsigns.stage_hunk, "Stage hunk" },
        S = { gitsigns.stage_buffer, "Stage buffer" },
        d = { gitsigns.diffthis, "Diff buffer" },
        r = { gitsigns.reset_hunk, "Reset hunk" },
        R = { gitsigns.reset_buffer, "Reset buffer" },
        p = { gitsigns.preview_hunk, "Preview hunk" },
        b = { gitsigns.toggle_current_line_blame, "Toggle blame"}
      }
    }, { buffer = bufnr })
  end
})
