return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      yaml = function(bufnr)
        local path = vim.api.nvim_buf_get_name(bufnr)
        if path:match("helm/") or path:match("charts/") then
          return { "prettier" } -- Helm context
        else
          return { "yamlfmt" } -- Kubernetes or other YAML
        end
      end,
      json = { "prettier" },
      markdown = { "prettier" },
      lua = { "stylua" },
      python = { "black" },
      go = { "goimports" },
    },
    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = true,
    },
  },
}