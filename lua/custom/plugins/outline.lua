return {
  {
    'hedyhli/outline.nvim',
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set('n', '<leader>o', '<cmd>Outline<CR>', { desc = 'Toggle Outline' })

      require('outline').setup {
        -- Your setup opts here (leave empty to use defaults)
        outline_window = {},
        symbols = {
          icons = {
            Function = { icon = '󰘧' },
            Constant = { icon = '󰏿' },
            Variable = { icon = '' },
            Class = { icon = '󰜂' },
            Struct = { icon = '󰜂', hl = 'Structure' },
          },
        },
      }
    end,
  },
}
