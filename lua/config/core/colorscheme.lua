-- lua/config/core/colorscheme.lua
return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Load before all other plugins
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
      }

      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}