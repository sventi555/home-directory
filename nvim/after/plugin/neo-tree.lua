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

vim.keymap.set('n', '<leader>tt', '<Cmd>Neotree toggle<Cr>')
vim.keymap.set('n', '<leader>tc', '<Cmd>Neotree close<Cr>')
vim.keymap.set('n', '<leader>tf', '<Cmd>Neotree focus<Cr>')
vim.keymap.set('n', '<leader>tg', '<Cmd>Neotree git_status<Cr>')
