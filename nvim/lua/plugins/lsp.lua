return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require('cmp')
      local cmp_lsp = require('cmp_nvim_lsp')
      local capabilities =
        vim.tbl_deep_extend('force', {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'ts_ls' },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({ capabilities = capabilities })
          end,
          ['lua_ls'] = function()
            local lspconfig = require('lspconfig')
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

      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = '[' .. entry.source.name .. ']'
            return vim_item
          end,
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<C-l>'] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          {
            name = 'nvim_lsp',
            entry_filter = function(entry)
              return require('cmp').lsp.CompletionItemKind.Text ~= entry:get_kind()
            end,
          },
          { name = 'nvim_lua' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        }),
      })
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
