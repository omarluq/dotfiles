return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").set_icon_by_filetype({ slim = "html" })
  end,
}
