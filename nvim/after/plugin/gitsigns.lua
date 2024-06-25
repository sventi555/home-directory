require('gitsigns').setup({
  current_line_blame_opts = {
    delay = 250
  },
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    map('n', '<leader>gs', gitsigns.stage_hunk)
    map('n', '<leader>gr', gitsigns.reset_hunk)
    map('n', '<leader>gR', gitsigns.reset_buffer)
    map('n', '<leader>gp', gitsigns.preview_hunk)
    map('n', '<leader>gb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>gd', gitsigns.diffthis)
    map('n', '<leader>gx', gitsigns.toggle_deleted)
  end
})
