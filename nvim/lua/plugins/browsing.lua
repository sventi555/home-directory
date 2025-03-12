return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = function()
      require('oil').setup({
        view_options = {
          show_hidden = true,
          is_always_hidden = function(name)
            local hide = {
              '.git',
              '.DS_Store',
            }

            for _, val in ipairs(hide) do
              if name == val then
                return true
              end
            end

            return false
          end,
        },
      })

      vim.keymap.set('n', '<leader>e', '<CMD>Oil<CR>', { desc = '[E]xplore files' })
    end,
  },
}
