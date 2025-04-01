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

      completion = {
        accept = { auto_brackets = { enabled = false } },
        menu = {
          draw = {
            columns = { { 'label', gap = 2, 'kind_icon' }, { 'label_description' } },
            components = {
              label_description = {
                text = function(ctx)
                  local lsp_client = vim.lsp.get_client_by_id(ctx.item.client_id)
                  if lsp_client == nil then
                    return ctx.label_description
                  end

                  local lsp_name = lsp_client.name
                  if lsp_name == 'ts_ls' then
                    return ctx.item.detail
                  end

                  return ctx.label_description
                end,
              },
            },
          },
        },
      },

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
}
