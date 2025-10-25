return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'saghen/blink.cmp',
    },
    config = function()
      local capabilities = vim.tbl_deep_extend(
        'force',
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require('blink.cmp').get_lsp_capabilities()
      )

      local lspconfig = require('lspconfig')
      -- local configs = require('lspconfig.configs')

      -- firestore rules lsp
      -- if not configs.firestore_ls then
      --   configs.firestore_ls = {
      --     default_config = {
      --       cmd = { vim.fn.stdpath('config') .. '/lsps/firestore-rules-lsp' },
      --       filetypes = { 'firestore-rules' },
      --       root_dir = lspconfig.util.root_pattern('.git'),
      --       settings = {},
      --     },
      --   }
      -- end
      -- lspconfig.firestore_ls.setup({})

      -- dart lsp
      -- if not configs.dartls then
      --   configs.dartls = {
      --     default_config = {
      --       cmd = { 'dart', 'language-server', '--protocol=lsp' },
      --       filetypes = { 'dart' },
      --       root_dir = lspconfig.util.root_pattern('pubspec.yaml'),
      --     },
      --   }
      -- end
      -- lspconfig.dartls.setup({})

      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'ts_ls' },
        automatic_installation = false,
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          end,
          ['lua_ls'] = function()
            lspconfig.lua_ls.setup({
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
            local organize_imports_params = function()
              local params = {
                command = '_typescript.organizeImports',
                arguments = { vim.api.nvim_buf_get_name(0) },
                title = '',
              }

              return params
            end

            local organize_imports_sync = function()
              vim.lsp.buf_request_sync(0, 'workspace/executeCommand', organize_imports_params(), 500)
            end

            local function organize_imports()
              vim.lsp.buf.execute_command(organize_imports_params())
            end

            lspconfig.ts_ls.setup({
              -- only seems to work for actual "functions", not arrow functions...
              -- settings = {
              --   completions = {
              --     completeFunctionCalls = true,
              --   },
              -- },
              on_attach = function()
                vim.keymap.set('n', '<leader>o', organize_imports, { desc = '[O]rganize imports' })
                vim.api.nvim_buf_create_user_command(0, 'OrganizeImports', organize_imports, {})
                vim.api.nvim_buf_create_user_command(0, 'OrganizeImportsSync', organize_imports_sync, {})
              end,
              capabilities = capabilities,
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
          map('<leader>r', vim.lsp.buf.rename, '[R]ename')
          map('<leader>d', vim.diagnostic.open_float, '[D]iagnostic')
        end,
      })
    end,
  },
}
