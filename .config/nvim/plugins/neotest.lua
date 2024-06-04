return {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap",
      "marilari88/neotest-vitest",
      "olimorris/neotest-rspec",
      "nvim-neotest/neotest-jest",
      "thenbe/neotest-playwright",
      "zidhuss/neotest-minitest",
    },
    config = function()
      require("neotest").setup({
        consumers = {
          -- add to your list of consumers
          playwright = require("neotest-playwright.consumers").consumers,
        },
        adapters = {
          require("neotest-vitest"),
          require("neotest-rspec"),
          require("neotest-jest"),
          require("neotest-minitest"),
          require("neotest-playwright").adapter({
            options = {
              persist_project_selection = true,
              enable_dynamic_test_discovery = true,
            },
          }),
        },
      })
    end,
}