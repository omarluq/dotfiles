return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { { "RRethy/nvim-treesitter-endwise" }, { "nushell/tree-sitter-nu" } },
    opts = function(_, opts)
      opts.endwise = { enable = true }
      opts.indent = { enable = true, disable = { "yaml", "ruby" } }
      opts.ensure_installed = {
        "bash",
        "embedded_template",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "ruby",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "rust",
        "nu",
      }
    end,
    build = ":TSUpdate",
  },
}
