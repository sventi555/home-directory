return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    -- must use config function as per treesitter docs
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'vimdoc' },
        auto_install = true,

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },
}
