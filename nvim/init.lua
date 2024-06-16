local vim = vim
local Plug = vim.fn['plug#']

-- Leader
vim.g.mapleader = ' '

-- Display
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.rnu = true
vim.opt.scrolloff = 2
vim.opt.updatetime = 50
vim.opt.showcmd = true
vim.opt.hlsearch = false

-- Windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Explorer (disable netrw)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

-- Remaps
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

-- Plugins
vim.call('plug#begin')

-- Tree sitter
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

-- Telescope
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['rev'] = '0.1.x' })

-- Oil
Plug('stevearc/oil.nvim')

-- sonokai
Plug('sainnhe/sonokai')

-- Prettier
Plug('prettier/vim-prettier')

-- LSP
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('L3MON4D3/LuaSnip')
Plug('VonHeikemen/lsp-zero.nvim', { ['branch'] = 'v3.x' })

-- git gutter
Plug('airblade/vim-gitgutter')

-- file tree
Plug('nvim-tree/nvim-web-devicons')
Plug('MunifTanjim/nui.nvim')
Plug('nvim-neo-tree/neo-tree.nvim')

vim.call('plug#end')

-- Color Scheme
vim.cmd.colorscheme("sonokai")

