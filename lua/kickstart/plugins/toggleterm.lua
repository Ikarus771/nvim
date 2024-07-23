return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {},
    config = function()
      require('toggleterm').setup {
        -- size can be a number or function which is passed the current terminal
        size = vim.o.columns * 0.3,
        start_in_insert = false,
      }

      vim.keymap.set('n', '<C-t>', ':ToggleTerm direction=vertical<CR>', { desc = 'ToggleTerm', noremap = true, silent = true })
    end,
  },
}
