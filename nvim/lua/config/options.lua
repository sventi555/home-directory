-- Leader
vim.g.mapleader = ' '

-- Display
vim.opt.number = true
vim.opt.rnu = true
vim.opt.scrolloff = 5
vim.opt.updatetime = 50
vim.opt.showcmd = true
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.scl = 'yes:1'

-- Windows
vim.opt.splitright = true

-- Explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.smartindent = true

-- register file types
vim.api.nvim_create_autocmd('BufRead', {
  pattern = 'firestore.rules',
  callback = function()
    vim.bo.filetype = 'firestore-rules'
  end,
})
