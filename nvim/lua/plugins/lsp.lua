return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local capabilities = vim.tbl_deep_extend(
        'force',
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require('cmp_nvim_lsp').default_capabilities()
      )

      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'ts_ls' },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({
              capabilities = capabilities,
            })
          end,
          ['lua_ls'] = function()
            require('lspconfig').lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { 'vim' },
                  },
                },
              },
            })
          end,
          ['ts_ls'] = function()
            local function organize_imports()
              local params = {
                command = '_typescript.organizeImports',
                arguments = { vim.api.nvim_buf_get_name(0) },
              }
              vim.lsp.buf.execute_command(params)
            end

            require('lspconfig').ts_ls.setup({
              on_attach = function()
                vim.api.nvim_create_autocmd('BufWritePre', {
                  callback = organize_imports,
                })
                vim.keymap.set('n', '<leader>o', organize_imports, { desc = '[O]rganize imports' })
              end,
              capabilities = capabilities,
              commands = {
                OrganizeImports = {
                  organize_imports,
                  description = 'Organize Imports',
                },
              },
            })
          end,
        },
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
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        end,
      })
    end,
  },
}
