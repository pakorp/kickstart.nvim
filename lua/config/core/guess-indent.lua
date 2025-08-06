-- lua/config/core/guess-indent.lua
return {
  'NMAC427/guess-indent.nvim',
  event = 'BufReadPre', -- optional lazy-load for performance
  config = function()
    require('guess-indent').setup {}
  end,
}