return {
  -- 🔍 Override gitsigns
  {
    'lewis6991/gitsigns.nvim',
    opts = function(_, opts)
      if vim.g.have_nerd_font then
        opts.signs = {
          add = { text = '▎' },
          change = { text = '▎' },
          delete = { text = '契' },
          topdelete = { text = '' },
          changedelete = { text = '▎' },
        }
      end
    end,
  },

  -- 🔍 Override DAP breakpoint icons
  {
    'mfussenegger/nvim-dap',
    config = function()
      if not vim.g.have_nerd_font then return end
      local icons = {
        Breakpoint = '',
        BreakpointCondition = '',
        BreakpointRejected = '',
        LogPoint = '',
        Stopped = '',
      }
      for type, icon in pairs(icons) do
        local hl = (type == 'Stopped') and 'DapStopped' or 'DapBreakpoint'
        vim.fn.sign_define('Dap' .. type, { text = icon, texthl = hl, numhl = hl })
      end
    end,
  },
}