return {
  "FabijanZulj/blame.nvim",
  opts = {
    blame_options = { "-w" },
  },
  keys = {
    {
      "<leader>gb",
      function()
        vim.cmd([[BlameToggle virtual]])
      end,
      desc = "Toggle git blame (virtual)",
    },
    {
      "<leader>gB",
      function()
        vim.cmd([[BlameToggle window]])
      end,
      desc = "Toggle git blame (window)",
    },
  },
}
