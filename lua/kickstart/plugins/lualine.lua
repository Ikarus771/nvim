return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- Makes inner Line Transparent
      local auto_theme_custom = require 'lualine.themes.auto'
      auto_theme_custom.normal.c.bg = 'none'
      require('lualine').setup {
        options = {
          icons_enabled = true,
          -- theme = require('filename').theme(),
          -- theme = 'auto',
          theme = auto_theme_custom,
          -- component_separators = { left = '|', right = '|' },
          -- component_separators = { left = '', right = '' },
          -- component_separators = { left = '\\', right = '/' },
          component_separators = { left = '', right = '' },
          -- section_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          -- section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = {
            'location',
            function()
              return require('auto-session.lib').current_session_name(true)
            end,
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      }
    end,
  },
}
