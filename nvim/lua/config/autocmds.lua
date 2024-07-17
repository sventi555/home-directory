-- don't include quickfix in list of buffers
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    vim.bo.buflisted = false
  end,
})
