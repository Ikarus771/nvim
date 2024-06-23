return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    config = function()
      require('ibl').setup {
        indent = {
          char = '▏',
        },
        scope = {
          show_start = false,
        },
      }
    end,
    opts = {},
  },
}
