local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    sorting_strategy = 'ascending',
    layout_config = {
      prompt_position = 'top'
    },
    mappings = {
      n = {
        ['<C-d>'] = actions.delete_buffer,
        ['<C-h>'] = actions.which_key
      },
      i = {
        ['<C-d>'] = actions.delete_buffer,
        ['<C-h>'] = actions.which_key
      }
    }
  }
})

telescope.load_extension('live_grep_args')

local wk = require('which-key')
wk.add({
  { '<leader>f', group = "Telescope" },
  { '<leader>ff', function() builtin.find_files() end, desc = "Find files" },
  { '<leader>fp', function() builtin.git_files() end, desc = "Find project files" },
  { '<leader>fs', function() telescope.extensions.live_grep_args.live_grep_args() end, desc = "Live grep" },
  { '<leader>fg', function() builtin.git_status() end, desc = "Find git changes" },
  { '<leader>fb', function() builtin.buffers() end, desc = "Find buffers" },
  { '<leader>fh', function() builtin.help_tags() end, desc = "Find help tags" }
})

