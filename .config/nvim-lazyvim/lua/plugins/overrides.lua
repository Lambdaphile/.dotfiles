local u = require("utils")

return {
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "catppuccin" },
  },

  {
    "catppuccin/nvim",
    opts = { flavour = "mocha" },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto",
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = {
          statusline = {
            "dashboard",
            "alpha",
            "ministarter",
            "snacks_dashboard",
          },
        },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "" }, right_padding = 2 },
        },
        lualine_b = { "branch" },
        lualine_c = {
          { LazyVim.lualine.pretty_path() },
          "diagnostics",
        },
        lualine_x = {
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
    },
  },

  {
    "echasnovski/mini.starter",
    opts = {
      header = function()
        local fortune = vim.fn.system("fortune -s -n 40 | cowsay")
        local pad = string.rep(" ", 8)
        local fortune_lines = {}

        for line in fortune:gmatch("[^\r\n]+") do
          table.insert(fortune_lines, pad .. line)
        end

        return table.concat(fortune_lines, "\n")
      end,
      items = {
        u.new_section("ff → Find file", LazyVim.pick(), "Telescope"),
        u.new_section(
          "rf → Recent files",
          LazyVim.pick("oldfiles"),
          "Telescope"
        ),
        u.new_section(
          "ft → Find text",
          LazyVim.pick("live_grep"),
          "Telescope"
        ),
        u.new_section("n  → New file", "ene | startinsert", "Built-in"),
        u.new_section("q  → Quit", "qa", "Built-in"),
        u.new_section("c  → Config", LazyVim.pick.config_files(), "Config"),
        u.new_section("l  → Lazy", "Lazy", "Config"),
        u.new_section("le → Lazy extras", "LazyExtras", "Config"),
        u.new_section(
          "rs → Restore session",
          [[lua require("persistence").load()]],
          "Session"
        ),
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },

  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      local sources = opts.picker.sources or {}
      local source_names = {
        "files",
        "explorer",
        "grep",
        "grep_word",
        "grep_buffers",
      }
      local source_opts = {
        hidden = true,
        ignored = true,
        exclude = { ".git" },
      }

      for _, name in ipairs(source_names) do
        sources[name] =
          vim.tbl_extend("force", sources[name] or {}, source_opts)
      end

      opts.picker.sources = sources

      return opts
    end,
  },
}
