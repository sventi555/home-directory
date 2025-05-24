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
          dart = { 'dart_format' },
          javascript = { 'prettier' },
          typescript = { 'prettier' },
          typescriptreact = { 'prettier' },
          json = { 'prettier' },
          yaml = { 'prettier' },
          css = { 'prettier' },
          scss = { 'prettier' },
        },
      })

      vim.keymap.set('n', '<leader>f', function()
        require('conform').format()
      end, { desc = '[F]ormat' })

      vim.api.nvim_create_autocmd('BufWritePre', {
        callback = function(args)
          if vim.fn.exists(':OrganizeImportsSync') > 0 then
            vim.cmd('OrganizeImportsSync')
          end

          require('conform').format({ bufnr = args.buf })
        end,
      })
    end,
  },
}
