-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- file browser
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    -- Optional dependencies
    -- dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function()
      require('oil').setup({
        view_options = {
          show_hidden = true,
        },
      })
      vim.keymap.set('n', '<leader>e', '<CMD>Oil --float<CR>', { desc = '[E]xplore parent directory' })
    end,
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    config = function()
      require('typescript-tools').setup({})

      vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
        pattern = { '*.ts', '*.tsx', '*.js', '*.jsx' },
        command = 'TSToolsOrganizeImports',
      })
    end,
  },
}
