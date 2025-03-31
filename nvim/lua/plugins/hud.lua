return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      sections = {
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = {},
      },
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      scope = {
        show_start = false,
        show_end = false,
      },
    },
  },
  {
    'shortcuts/no-neck-pain.nvim',
    config = function()
      vim.keymap.set('n', '<leader>z', '<Cmd>NoNeckPain<CR>', { desc = '[Z]en mode' })
    end,
  },
}
