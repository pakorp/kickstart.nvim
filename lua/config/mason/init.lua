return {
  {
    "williamboman/mason.nvim",
    config = true, -- equivalent to: require("mason").setup()
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {}, -- intentionally left empty; handled elsewhere
        automatic_installation = false,
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- Linters
          "golangci-lint",
          "flake8",
          "shellcheck",
          "yamllint",
          "jsonlint",
          "markdownlint",
          "eslint_d",
          "taplo",
          "js-debug-adapter",

          -- Formatters (if using conform or null-ls later)
          "black",
          "goimports",
          "yamlfmt",      -- Kubernetes YAML
          "prettier",
          "stylua",

          -- LSP servers (optional but good idea)
          "gopls",
          "pyright",
          "rust-analyzer",
          "bash-language-server",
          "json-lsp",
          "yamlls",
          "marksman", -- markdown LSP
        },
        auto_update = false,
        run_on_start = true,
      })
    end,
  },
}