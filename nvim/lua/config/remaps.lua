-- scroll by 3 lines rather than 1
vim.keymap.set('n', '<C-e>', '3<C-e>')
vim.keymap.set('n', '<C-y>', '3<C-y>')

-- go back to cursor position after yanking in vmode
vim.keymap.set('v', 'y', 'ygv<Esc>')

-- center search results
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- center after scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- paste without losing results
vim.keymap.set('x', '<leader>p', '"_dP')

-- quickfix
vim.keymap.set('n', '<leader>q', function()
  local windows = vim.fn.getwininfo()
  for _, win in pairs(windows) do
    if win['quickfix'] == 1 then
      vim.cmd.cclose()
      return
    end
  end
  vim.cmd.copen()
end, { desc = 'Toggle [Q]uickfix' })
vim.keymap.set('n', '<C-n>', '<Cmd>cnext<CR>')
vim.keymap.set('n', '<C-p>', '<Cmd>cprev<CR>')
