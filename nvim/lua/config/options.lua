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

-- no line numbers for terminal
vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})
