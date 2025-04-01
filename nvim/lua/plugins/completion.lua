return {
  {
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      appearance = {
        nerd_font_variant = 'mono',
      },

      completion = { documentation = { auto_show = true } },

      signature = { enabled = true },

      sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
    },
  },
  -- {
  --   'hrsh7th/nvim-cmp',
  --   lazy = false,
  --   dependencies = {
  --     'hrsh7th/cmp-nvim-lsp',
  --     'hrsh7th/cmp-buffer',
  --     'hrsh7th/cmp-path',
  --     'hrsh7th/cmp-cmdline',
  --     'L3MON4D3/LuaSnip',
  --     'saadparwaiz1/cmp_luasnip',
  --   },
  --   config = function()
  --     local cmp = require('cmp')
  --
  --     cmp.setup({
  --       snippet = {
  --         expand = function(args)
  --           require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  --         end,
  --       },
  --       window = {
  --         completion = cmp.config.window.bordered(),
  --         documentation = cmp.config.window.bordered(),
  --       },
  --       mapping = cmp.mapping.preset.insert({
  --         ['<C-space>'] = cmp.mapping.complete(),
  --
  --         -- traditional vim maps
  --         ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
  --         ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
  --         ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  --       }),
  --       sources = cmp.config.sources({
  --         {
  --           name = 'lazydev',
  --           -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
  --           group_index = 0,
  --         },
  --         { name = 'nvim_lsp' },
  --         { name = 'luasnip' },
  --         { name = 'buffer' },
  --       }),
  --     })
  --   end,
  -- },
}
