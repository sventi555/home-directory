require('neo-tree').setup({
  close_if_last_window = true,
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      never_show = {
        ".git",
        ".DS_Store"
      }
    },
    follow_current_file = {
      enabled = true
    },
    hijack_netrw_behavior = "disabled"
  }
})
vim.keymap.set('n', '<leader>t', '<Cmd>Neotree toggle<Cr>')
