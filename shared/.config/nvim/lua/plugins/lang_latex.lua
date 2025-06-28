return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "texlab",
        "tex-fmt",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    -- opts will be merged with the parent spec
    opts = {
      formatters_by_ft = {
        tex = { "tex-fmt" },
      },
    },
  },
}
