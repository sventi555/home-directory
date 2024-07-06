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
wk.register({
  ['<leader>f'] = {
    name = "Telescope",
    f = { builtin.find_files, "Find files" },
    p = { builtin.git_files, "Find project files" },
    s = { telescope.extensions.live_grep_args.live_grep_args, "Live grep" },
    g = { builtin.git_status, "Find git changes" },
    b = { builtin.buffers, "Find buffers" },
    h = { builtin.help_tags, "Find help tags" }
  }
})

