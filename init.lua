return {
  plugins = {
    init = {
      ["Darazaki/indent-o-matic"] = { disable = true },
    },
  },
  updater = {
    remote = "origin",
    channel = "stable",
    version = "latest",
    branch = "nightly",
    commit = nil,
    pin_plugins = nil,
    skip_prompts = false,
    show_changelog = true,
    auto_quit = false,
    remotes = {},
  },
  colorscheme = "nord",
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {},
        ignore_filetypes = {},
      },
      disabled = {},
      timeout_ms = 1000,
      filter = function(client)
        if vim.bo.filetype == "javascript" or vim.bo.filetype == "html" or vim.bo.filetype == "typescript" then
          return client.name == "null-ls"
        end
        return true
      end,
    },
    servers = {
      "dartls",
    },
    setup_handlers = {
      -- dartls = function(_, opts) require("flutter-tools").setup { lsp = opts } end,
      rust_analyzer = function(_, opts) require("rust-tools").setup { server = opts } end,
    },
    config = {
      dartls = {
        color = {
          enabled = true,
        },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
        },
      },
    },
  },
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  -- highlights = {
  --   init = {
  --     Normal = { bg = "NONE", ctermbg = "NONE" },
  --     NormalNC = { bg = "NONE", ctermbg = "NONE" },
  --     CursorColumn = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
  --     CursorLine = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
  --     CursorLineNr = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
  --     LineNr = {},
  --     SignColumn = {},
  --     StatusLine = {},
  --     NeoTreeNormal = { bg = "NONE", ctermbg = "NONE" },
  --     NeoTreeNormalNC = { bg = "NONE", ctermbg = "NONE" },
  --   },
  -- },
  polish = function() end,
}
