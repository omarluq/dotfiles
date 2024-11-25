return {
  "FabijanZulj/blame.nvim",
  opts = {
    blame_options = { "-w" },
  },
  keys = {
    {
      "<leader>cb",
      function()
        vim.cmd([[BlameToggle virtual]])
      end,
      desc = "Toggle git blame (virtual)",
    },
    {
      "<leader>cB",
      function()
        vim.cmd([[BlameToggle window]])
      end,
      desc = "Toggle git blame (window)",
    },
  },
}
