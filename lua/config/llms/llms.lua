return {
  "olimorris/codecompanion.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "nvim-telescope/telescope.nvim" },
  config = function()
    require("codecompanion").setup({
      adapters = {
        openai = {
          api_key = os.getenv("OPENAI_API_KEY"),
          model = "gpt-4o",
        },
        anthropic = {
          api_key = os.getenv("ANTHROPIC_API_KEY"),
          model = "claude-3-7-sonnet-latest",
        },
        xai = {
          api_key = os.getenv("XAI_API_KEY"),
          model = "grok-4",
        },
      },
      opts = {
        log_level = "DEBUG", -- For troubleshooting
      },
    })
  end,
}