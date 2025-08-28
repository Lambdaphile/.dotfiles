local utils = require("utils")
local constants = require("constants")

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
        utils.new_section("ff - Find file", LazyVim.pick(), "Telescope"),
        utils.new_section(
          "ft - Find text",
          LazyVim.pick("live_grep"),
          "Telescope"
        ),

        utils.new_section(
          "rf - Recent files",
          LazyVim.pick("oldfiles"),
          "Telescope"
        ),
        utils.new_section(
          "sp - Select project",
          LazyVim.pick("projects"),
          "Telescope"
        ),
        utils.new_section("n  - New file", "ene | startinsert", "Built-in"),
        utils.new_section("q  - Quit", "qa", "Built-in"),
        utils.new_section("c  - Config", LazyVim.pick.config_files(), "Config"),
        utils.new_section("l  - Lazy", "Lazy", "Config"),
        utils.new_section("le - Lazy extras", "LazyExtras", "Config"),
        utils.new_section(
          "ss - Select session",
          [[lua require("persistence").select()]],
          "Session"
        ),
        utils.new_section(
          "rs - Restore session",
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
      local source_names =
        { "files", "grep", "grep_world", "grep_buffer", "explorer" }

      for _, name in ipairs(source_names) do
        sources[name] = constants.PICKER_SETTINGS
      end

      opts.picker.sources = sources

      return opts
    end,
  },

  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        ghost_text = {
          enabled = false,
        },
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        auto_toggle_bufferline = false,
      },
    },
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = function(_, opts)
      local headers = opts.headers or {}
      headers.user = "## 🦸 Me "
      headers.assistant = "## 🦉 Wan "
      opts.headers = headers

      local window = opts.window or {}
      window.width = 0.33
      opts.window = window

      opts.highlight_headers = true

      return opts
    end,
  },
}
