return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      ensure_installed = {
        'stylua',
        'biome',
        -- 'black',
        -- 'isort',
      },
    },
  },
  {
    'stevearc/conform.nvim',
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          lua = { 'stylua' },
          javascript = { 'biome' },
          typescript = { 'biome' },
          typescriptreact = { 'biome' },
          json = { 'biome' },
          yaml = { 'biome' },
          css = { 'biome' },
          scss = { 'biome' },
          html = { 'biome' },
          -- dart = { 'dart_format' },
          -- go = { 'gofmt' }
          -- python = { 'black', 'isort'}
        },
      })

      vim.keymap.set('n', '<leader>f', function()
        require('conform').format()
      end, { desc = '[F]ormat' })

      vim.api.nvim_create_autocmd('BufWritePre', {
        callback = function(args)
          require('conform').format({ bufnr = args.buf })
        end,
      })
    end,
  },
}
