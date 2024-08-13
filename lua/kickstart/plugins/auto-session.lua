return {
  {
    'rmagatti/auto-session',
    lazy = false,
    dependencies = {
      'nvim-telescope/telescope.nvim', -- Only needed if you want to use sesssion lens
    },
    config = function()
      vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
      require('auto-session').setup {
        auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/', 'C:/Program Files/Neovim/bin' },
        -- auto_clean_after_session_restore = false,
        opts = {
          auto_session_enabled = true,
          auto_session_enable_last_session = true,
          -- log_level = 'debug',
        },
      }
      vim.keymap.set('n', '<C-i>', ':Autosession search<CR>', { desc = 'Session-View', noremap = true, silent = true })
    end,
  },
  -- {
  --   'rmagatti/session-lens',
  --   lazy = false,
  --   config = function()
  --     require('auto-session').setup {
  --       -- ⚠️ This will only work if Telescope.nvim is installed
  --       -- The following are already the default values, no need to provide them if these are already the settings you want.
  --       session_lens = {
  --         -- If load_on_setup is false, make sure you use `:SessionSearch` to open the picker as it will initialize everything first
  --         load_on_setup = true,
  --         theme_conf = { border = true },
  --         previewer = false,
  --         mappings = {
  --           -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
  --           delete_session = { 'i', '<C-D>' },
  --           alternate_session = { 'i', '<C-S>' },
  --         },
  --       },
  --     }
  --   end,
  -- },
}
