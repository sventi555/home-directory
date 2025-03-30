return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      ensure_installed = { 'stylua', 'prettier' },
    },
  },
  {
    'stevearc/conform.nvim',
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          lua = { 'stylua' },
          javascript = { 'prettier' },
          typescript = { 'prettier' },
          typescriptreact = { 'prettier' },
          json = { 'prettier' },
          yaml = { 'prettier' },
          css = { 'prettier' },
          scss = { 'prettier' },
        },
      })

      vim.api.nvim_create_autocmd('BufRead', {
        callback = function(args)
          vim.keymap.set('n', '<leader>f', function()
            require('conform').format({ bufnr = args.buf })
          end, { desc = '[F]ormat' })
        end,
      })

      vim.api.nvim_create_autocmd('BufWritePre', {
        callback = function(args)
          require('conform').format({ bufnr = args.buf })
        end,
      })
    end,
  },
}
