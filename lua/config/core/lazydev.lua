-- Improves Lua dev experience for Neovim configs and plugins.

return {
  'folke/lazydev.nvim',
  ft = 'lua',
  opts = {
    library = {
      -- Load luvit types when 'vim.uv' is used
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    },
  },
}
