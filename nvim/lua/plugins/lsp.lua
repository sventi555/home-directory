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
      local configs = require('lspconfig.configs')

      if not configs.firestore_ls then
        configs.firestore_ls = {
          default_config = {
            cmd = { 'firestore-rules-lsp' },
            filetypes = { 'rules' },
            root_dir = lspconfig.util.root_pattern('.git'),
            settings = {},
          },
        }
      end
      lspconfig.firestore_ls.setup({})

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
            local function organize_imports()
              local params = {
                command = '_typescript.organizeImports',
                arguments = { vim.api.nvim_buf_get_name(0) },
                title = '',
              }
              vim.lsp.buf.execute_command(params)
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
          map('<leader>r', vim.lsp.buf.rename, '[R]ename')
          map('<leader>d', vim.diagnostic.open_float, '[D]iagnostic')
        end,
      })
    end,
  },
}
