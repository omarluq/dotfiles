return {
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = function()
      return {
        open_cmd = "vnew",
        live_update = false,
        line_sep_start = "┌-----------------------------------------",
        result_padding = "¦  ",
        line_sep = "└-----------------------------------------",
        highlight = {
          ui = "String",
          search = "DiffChange",
          replace = "DiffDelete",
        },
        find_engine = {
          ["rg"] = {
            cmd = "rg",
            args = {
              "--color=never",
              "--no-heading",
              "--with-filename",
              "--line-number",
              "--column",
            },
            options = {
              ["ignore-case"] = {
                value = "--ignore-case",
                icon = "[I]",
                desc = "ignore case",
              },
              ["hidden"] = {
                value = "--hidden",
                desc = "hidden file",
                icon = "[H]",
              },
            },
          },
        },
        replace_engine = {
          ["sed"] = {
            cmd = "sed",
            args = nil,
            options = {
              ["ignore-case"] = {
                value = "--ignore-case",
                icon = "[I]",
                desc = "ignore case",
              },
            },
          },
          ["oxi"] = {
            cmd = "oxi",
            args = {},
            options = {
              ["ignore-case"] = {
                value = "i",
                icon = "[I]",
                desc = "ignore case",
              },
            },
          },
        },
        default = {
          find = {
            cmd = "rg",
            options = { "ignore-case" },
          },
          replace = {
            cmd = "sed",
          },
        },
        replace_vim_cmd = "cdo",
        is_open_target_win = true,
        is_insert_mode = false,
      }
    end,
    keys = {
      {
        "<leader>S",
        function()
          require("spectre").open()
        end,
        desc = "Open Spectre",
      },
      {
        "<leader>sw",
        function()
          require("spectre").open_visual({ select_word = true })
        end,
        desc = "Search current word",
      },
      {
        "<leader>sw",
        function()
          require("spectre").open_visual()
        end,
        desc = "Search current selection",
        mode = "v",
      },
      {
        "<leader>sp",
        function()
          require("spectre").open_file_search({ select_word = true })
        end,
        desc = "Search in current file",
      },
    },
    config = function(_, opts)
      require("spectre").setup(opts)
      local function custom_replace()
        local changes = require("spectre.state").get_changes()
        for _, change in ipairs(changes) do
          local cmd = string.format("silent! %d,%ds/%s/%s/ge", change.lnum, change.lnum, change.from, change.to)
          vim.cmd(cmd)
        end
        vim.cmd("silent! wa")
      end
      vim.keymap.set("n", "<leader>R", custom_replace, { buffer = true, desc = "Replace all (custom)" })
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        table.insert(opts.ensure_installed, "ripgrep")
      else
        opts.ensure_installed = { "ripgrep" }
      end
    end,
  },
}
