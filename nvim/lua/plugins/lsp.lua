return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'mason-org/mason.nvim',
      'mason-org/mason-lspconfig.nvim',
    },
    config = function()
      local capabilities = vim.tbl_deep_extend(
        'force',
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require('cmp_nvim_lsp').default_capabilities()
      )

      -- Apply capabilities to every server by default
      vim.lsp.config('*', {
        capabilities = capabilities,
      })

      -- Per-server overrides via vim.lsp.config()
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      })

      vim.lsp.config('tailwindcss', {
        settings = {
          tailwindCSS = {
            lint = {
              suggestCanonicalClasses = 'ignore',
            },
          },
        },
      })

      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'ts_ls',
          'eslint',
          'biome',
          'tailwindcss',
          'cssls',
          'rust_analyzer',
          -- 'gopls',
          -- 'pyright',
        },
        automatic_enable = true,
      })

      local builtin = require('telescope.builtin')

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
          map('gr', builtin.lsp_references, '[G]oto [R]eferences')
          map('gD', vim.lsp.buf.type_definition, '[G]oto Type [D]efinition')
          map('<leader>r', vim.lsp.buf.rename, '[R]ename')
          map('<leader>d', vim.diagnostic.open_float, '[D]iagnostic')
        end,
      })
    end,
  },
}
