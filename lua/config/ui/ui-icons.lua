-- lua/config/ui/ui-icons.lua
return {
  -- Customize signs for Git changes (gitsigns.nvim)
  {
    'lewis6991/gitsigns.nvim',
    opts = function(_, opts)
      if vim.g.have_nerd_font then
        opts.signs = {
          add          = { text = '▎' },
          change       = { text = '▎' },
          delete       = { text = '契' },
          topdelete    = { text = '' },
          changedelete = { text = '▎' },
        }
      end
    end,
  },

  -- Customize icons for DAP breakpoints (nvim-dap)
  {
    'mfussenegger/nvim-dap',
    config = function()
      if not vim.g.have_nerd_font then return end

      local icons = {
        Breakpoint          = '',
        BreakpointCondition = '',
        BreakpointRejected  = '',
        LogPoint            = '',
        Stopped             = '',
      }

      for type, icon in pairs(icons) do
        local hl = (type == 'Stopped') and 'DapStopped' or 'DapBreakpoint'
        vim.fn.sign_define('Dap' .. type, { text = icon, texthl = hl, numhl = hl })
      end
    end,
  },
    {
    ui = {
      -- If you are using a Nerd Font: set icons to an empty table which will use the
      -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
      icons = vim.g.have_nerd_font and {} or {
        cmd = '⌘',
        config = '🛠',
        event = '📅',
        ft = '📂',
        init = '⚙',
        keys = '🗝',
        plugin = '🔌',
        runtime = '💻',
        require = '🌙',
        source = '📄',
        start = '🚀',
        task = '📌',
        lazy = '💤 ',
    },
  },
}