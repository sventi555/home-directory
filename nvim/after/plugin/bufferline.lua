require('bufferline').setup()

vim.keymap.set('n', '<leader>bg', '<Cmd>BufferLinePick<CR>')
vim.keymap.set('n', '<leader>bd', '<Cmd>bd<CR>')
vim.keymap.set('n', '<leader>bD', '<Cmd>BufferLinePickClose<CR>')
vim.keymap.set('n', '<leader>bcr', '<Cmd>BufferLineCloseRight<CR>')
vim.keymap.set('n', '<leader>bco', '<Cmd>BufferLineCloseOthers<CR>')
vim.keymap.set('n', '<leader>bn', '<Cmd>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<leader>bp', '<Cmd>BufferLineCyclePrev<CR>')
