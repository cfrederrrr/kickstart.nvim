return {
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup()
      vim.cmd 'NvimTreeOpen'
      vim.cmd 'wincmd w'
    end,
  },
}
