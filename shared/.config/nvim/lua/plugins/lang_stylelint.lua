return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        stylelint_lsp = {},
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylelint",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    -- opts will be merged with the parent spec
    opts = {
      formatters_by_ft = {
        css = { "stylelint" },
        scss = { "stylelint" },
      },
    },
  },
}
