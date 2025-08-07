-- lua/config/lsp/config.lua
return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Setup enhancements (moved to mason.lua)
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'saghen/blink.cmp',
      'j-hui/fidget.nvim',
    },
    config = function()
      -- Setup LSP keymaps on attach
      require('config.lsp.on_attach').setup()

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Define server-specific configs
      -- config.lua
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = { callSnippet = 'Replace' },
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
        gopls = {},
        pyright = {},
        rust_analyzer = {},
        bashls = {},
        jsonls = {},
        yamlls = {},
        marksman = {},
      }

      -- Setup all LSPs via mason-lspconfig (new v2+ API)
      local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
      if ok then
        mason_lspconfig.setup {
          handlers = {
            function(server_name)
              local server = servers[server_name] or {}
              server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
              require('lspconfig')[server_name].setup(server)
            end,
          },
        }
      end

      -- Diagnostic style
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            return diagnostic.message
          end,
        },
      }
    end,
  }
}