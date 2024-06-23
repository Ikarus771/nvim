return {
  {
    'goolord/alpha-nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      vim.keymap.set('n', '<C-a>', ':Alpha<CR>', { desc = '[A]lpha' })

      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'
      math.randomseed(os.time())
      local pick = math.random(2)
      local function get_dir()
        return debug.getinfo(2, 'S').source:sub(2):match '(.*/)'
      end

      -- Function to read the contents of a file as List
      local function read_file(file_path)
        local file = io.open(file_path, 'r') -- Open the file in read mode
        local t = {}
        if not file then
          table.insert(t, 'file not found: ' .. file_path)
          return t
        end
        local content = file:read '*a' -- Read the entire file
        file:close() -- Close the file
        for line in content:gmatch '([^\n]*)\n?' do
          table.insert(t, line)
        end
        return t
      end

      -- Fetch Path and then Art
      local path = get_dir() .. 'dashboard-imgs/' .. pick .. '.txt'
      dashboard.section.header.val = read_file(path)
      table.insert(dashboard.section.header.val, string.format('              %s', os.date ' %d-%m-%Y   %H:%M:%S'))

      -- Set menu
      dashboard.section.buttons.val = {
        dashboard.button('e', '  > New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('f', '󰱼  > Find file', ':cd C:/Workspace | Telescope find_files<CR>'),
        dashboard.button('r', '  > Recent', ':Telescope oldfiles<CR>'),
        dashboard.button('s', '  > Settings', ':e $MYVIMRC | :Neotree reveal_force_cwd<CR>'),
        dashboard.button('q', '  > Quit NVIM', ':qa<CR>'),
      }

      -- Set footer
      --   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
      --   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
      --   ```init.lua
      --   return require('packer').startup(function()
      --       use 'wbthomason/packer.nvim'
      --       use {
      --           'goolord/alpha-nvim', branch = 'feature/startify-fortune',
      --           requires = {'BlakeJC94/alpha-nvim-fortune'},
      --           config = function() require("config.alpha") end
      --       }
      --   end)
      --   ```
      -- local fortune = require("alpha.fortune")
      -- dashboard.section.footer.val = fortune()

      dashboard.section.footer.val = function()
        local plugins = #vim.tbl_keys(require('lazy').plugins())
        local v = vim.version()
        local platform = vim.fn.has 'win32' == 1 and '' or ''
        return string.format('󰂖 %d  %s %d.%d.%d', plugins, platform, v.major, v.minor, v.patch)
      end

      -- Send config to alpha
      alpha.setup(dashboard.opts)

      -- Disable folding on alpha buffer
      vim.cmd [[
        autocmd FileType alpha setlocal nofoldenable
      ]]
    end,
  },
}
